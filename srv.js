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
const exrpess = require('express');
const https = require('https');
const getLuaObject = require('./lua/getLuaObject');
const app = exrpess();
const Cache = require('./cache');

const baseUrl = 'https://warframe.wikia.com/api.php?';
const query = 'action=query&prop=revisions&rvprop=content&format=json&formatversion=2&titles=';

const wfWeaponsDataUrl = baseUrl + query + 'Module%3AWeapons%2Fdata';
const wfModsDataUrl = baseUrl + query + 'Module%3AMods%2Fdata';
const wfIconDataUrl = baseUrl + query + 'Module%3AIcon%2Fdata';
const wfVoidDataUrl = baseUrl + query + 'Module%3AVoid%2Fdata';
const wfVersionDataUrl = baseUrl + query + 'Module%3AVersion%2Fdata';

let cache = {
  weapons: new Cache(wfWeaponsDataUrl, 'Weapons'),
  mods: new Cache(wfModsDataUrl, 'Mods'),
  icons: new Cache(wfIconDataUrl, 'Icons'),
  void: new Cache(wfVoidDataUrl, 'Void'),
  version: new Cache(wfVersionDataUrl, 'Version')
};

function cacheRequest (which) {
  return function (req, res, next) {
    which.get()
      .then(data => {
        return res.status(200).json(data);
      })
      .catch(err => {
        return res.status(500).json({error: err});
      });
  };
}

function cacheMeta (which) {
  return function (req, res, next) {
    which.getMeta()
      .then(data => {
        return res.status(200).json(data);
      })
      .catch(err => {
        return res.status(500).json({error: err});
      });
  };
}

// Create the routes.
for(let key in cache){
  if(!cache.hasOwnProperty(key)){
    continue;
  }
  app.get('/' + key + '-data', cacheRequest(cache[key]));
  app.get('/' + key + '-data/meta', cacheMeta(cache[key]));
}

app.listen('8090');