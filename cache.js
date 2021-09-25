/**
 *  wfApi,
 *  Copyright (C) 2018 Ilkka Kuosmanen
 *
 *  This file is part of wfApi.
 *
 *  wfApi is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  wfApi is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with wfApi.  If not, see <http://www.gnu.org/licenses/>.
 */
"use strict";
const https = require("https");
const crypto = require("crypto");
const getLuaObject = require("./lua/getLuaObject");
const CustomError = require("./error").CustomError;

/**
 * @typedef {Object} MetaObject
 * @property {number} lastRefresh The last refresh js timestamp.
 * @property {number} nRefresh How many times the cache has been refreshed.
 * @property {PromiseLike<ArrayBuffer>} hash A hash of the data.
 * @property {string} license The license under which the data is licensed.
 */

/**
 * @typedef {Object} ResponseObject
 * @property {Object} data Response data.
 * @property {MetaObject} meta Metadata for the response.
 */

/**
 * @typedef {Object} DependencyInfo
 * @property {string} module
 * @property {Cache} cache
 */

/**
 * A cache module class.
 */
class Cache {
  /**
   * Create a new cache module.
   * @param {string} dataUrl Url to the Wikia module.
   * @param {string} name Name of the cache module.
   * @param {DependencyInfo[]} dependentOn
   */
  constructor(dataUrl, name, dependentOn) {
    this.data = null;
    this.src = null;
    this.name = name;
    this.lastRefresh = 0;
    this.nRefresh = 0;
    this.dataUrl = dataUrl;
    this.dependentOn = dependentOn;

    const dependencyResolve = this.dependentOn ? this.dependentOn.map((dependency) => {
      return dependency.cache.get();
    }) : []
    Promise.all(dependencyResolve)
      .then(() => {
        return this.get();
      })
      .then(() => {
        console.log("Cache initialized for: " + this.name);
      })
      .catch((e) => {
        console.log("Failed to initialize cache for: " + this.name);
        console.error(e);
      });
  }

  /**
   * Find the 'revisions' object from the given object.
   * @param {object} data The object from which the 'revisions' object is searched for.
   * @returns {object} The data inside revisions object.
   * @private
   */
  static _findRevisions(data) {
    if ("revisions" in data && data.hasOwnProperty("revisions")) {
      return data["revisions"][0]["slots"]["main"]["content"];
    }
    for (let key in data) {
      if (!data.hasOwnProperty(key)) {
        continue;
      }
      if (typeof data[key] === "object") {
        return this._findRevisions(data[key]);
      }
    }
    return null;
  }

  /**
   * Make a 'GET' request to given Wikia url and get the data inside of the lua object.
   * @param {string} url Wikia api url.
   * @param {DependencyInfo} dependencies
   * @returns {Promise<object, Object>} The content of the lua object.
   * @private
   */
  _getRequest(url, dependencies) {
    return new Promise((resolve, reject) => {
      https
        .get(url, (res) => {
          let data = "";
          res.on("data", (d) => {
            data += d;
          });

          res.on("end", () => {
            if (data.length === 0) {
              return reject(new CustomError("No data."));
            }
            try {
              let parsed = JSON.parse(data.toString());
              let revisions = Cache._findRevisions(parsed);
              this.src = revisions;
              getLuaObject(revisions, dependencies)
                .then((data) => {
                  return resolve(data);
                })
                .catch((err) => {
                  return reject(
                    new CustomError("Failed to get lua data.", err)
                  );
                });
            } catch (e) {
              return reject(
                new CustomError("Failed to parse or find revisions.", e)
              );
            }
          });
        })
        .on("error", (err) => {
          return reject(new CustomError("Failed to retrieve data.", err));
        });
    });
  }

  /**
   * Create a sha256 hash of the cached data.
   * @returns {PromiseLike<ArrayBuffer>} Base64 encoded hash.
   */
  createHash() {
    let hash = crypto.createHash("sha256");
    hash.update(JSON.stringify(this.data));
    return hash.digest("base64");
  }

  /**
   * Create a meta data object.
   * @returns {MetaObject}
   */
  createMeta() {
    return {
      nRefresh: this.nRefresh,
      lastRefresh: this.lastRefresh,
      hash: this.createHash(),
      license: "CC BY-SA",
    };
  }

  /**
   * Get the cached data or refresh the cache.
   * @returns {Promise<ResponseObject,Object>} Returns the cached data object.
   */
  get() {
    return new Promise((resolve, reject) => {
      if (
        !this.data ||
        !this.lastRefresh ||
        this.lastRefresh + 1000 * 60 * 60 < Date.now()
      ) {
        if (this.dataUrl) {
          this._getRequest(this.dataUrl, this.dependentOn)
            .then((data) => {
              this.lastRefresh = Date.now();
              this.data = data;
              this.nRefresh++;
              return resolve({
                data: this.data,
                meta: this.createMeta(),
              });
            })
            .catch((err) => {
              return reject(new CustomError("Failed at requesting data.", err));
            });
        } else {
          return reject(
            new CustomError("No data url.", {}, { name: this.name })
          );
        }
      } else {
        return resolve({
          data: this.data,
          meta: this.createMeta(),
        });
      }
    });
  }

  /**
   * Get the meta data for cache module
   * @returns {Promise<MetaObject, Object>} The metadata object for cache module.
   */
  getMeta() {
    return new Promise((resolve, reject) => {
      this.get()
        .then(() => {
          return resolve({ meta: this.createMeta() });
        })
        .catch((e) => {
          return reject(new CustomError("Failed to generate meta object.", e));
        });
    });
  }
}

module.exports = Cache;
