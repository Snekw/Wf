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
'use strict';
const https = require('https');
const crypto = require('crypto');
const getLuaObject = require('./lua/getLuaObject');

class Cache {
  constructor (dataUrl, name) {
    this.data = null;
    this.name = name;
    this.lastRefresh = null;
    this.nRefresh = 0;
    this.dataUrl = dataUrl;
    this.get().then(() => {
      console.log('Cache initialized for: ' + this.name);
    }).catch(e => {
      console.log('Failed to initialize cache for: ' + this.name);
      console.error(e);
    });
  }

  static _findRevisions (data) {
    if ('revisions' in data && data.hasOwnProperty('revisions')) {
      return data['revisions'][0]['*'];
    }
    for (let key in data) {
      if (!data.hasOwnProperty(key)) {
        continue;
      }
      if (typeof data[key] === 'object') {
        return this._findRevisions(data[key]);
      }
    }
    return null;
  }

  static _getRequest (url) {
    return new Promise((resolve, reject) => {
      https.get(url, res => {
        let data = '';
        res.on('data', d => {
          data += d;
        });

        res.on('end', () => {
          if (data.length === 0) {
            return reject('No data');
          }
          try {
            let parsed = JSON.parse(data.toString());
            let revisions = Cache._findRevisions(parsed);
            getLuaObject(revisions)
              .then(data => {
                return resolve(data);
              })
              .catch(err => {
                return reject(err);
              });
          } catch (e) {
            return reject(e);
          }
        });
      }).on('error', err => {
        return reject(err);
      });
    });
  }

  createHash () {
    let hash = crypto.createHash('sha256');
    hash.update(JSON.stringify(this.data));
    return hash.digest('base64');
  }

  createMeta(){
    return {
      nRefresh: this.nRefresh,
      lastRefresh: this.lastRefresh,
      hash: this.createHash()
    }
  }

  get () {
    return new Promise((resolve, reject) => {
      if (!this.data || !this.lastRefresh || this.lastRefresh + 1000 * 60 * 60 < Date.now()) {
        if (this.dataUrl) {
          Cache._getRequest(this.dataUrl)
            .then(data => {
              this.lastRefresh = Date.now();
              this.data = data;
              this.nRefresh++;
              return resolve({
                data: this.data,
                meta: this.createMeta()
              });
            })
            .catch(err => {
              return reject(err);
            });
        } else {
          return reject('No data url.');
        }
      } else {
        return resolve({
          data: this.data,
          meta: this.createMeta()
        });
      }
    });
  }

  getMeta () {
    return new Promise((resolve, reject) => {
      this.get()
        .then(() => {
          return resolve({meta: this.createMeta()});
        })
        .catch(e => {
          return reject(e);
        });
    });
  }
}

module.exports = Cache;
