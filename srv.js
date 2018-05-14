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

const wfWeaponsDataUrl = 'https://warframe.wikia.com/api.php?action=query&prop=revisions&rvprop=content&format=json&formatversion=2&titles=Module%3AWeapons%2Fdata';

let cachedData = null;
let lastCacheRefresh = null;

app.get('/weapons-data', function (req, res, next) {
  if(!cachedData || !lastCacheRefresh || lastCacheRefresh + 1000*60*60 < Date.now()) {
    https.get(wfWeaponsDataUrl, (wfRes) => {
      let data = '';
      wfRes.on('data', (d) => {
        data += d;
      });

      wfRes.on('end', () => {
        let parsed = JSON.parse(data.toString());
        let actual = parsed.query.pages[1175547].revisions[0];
        getLuaObject(actual['*']).then(data=>{
          cachedData = data;
          lastCacheRefresh = Date.now();
          return res.status(200).json({data: data});
        }).catch(err=>{
          return res.status(500).json({error: 'Failed to parse weapon data.'});
        })
      });
    }).on('error', (e) => {
      return res.status(500).json({error: 'Failed to fetch weapon data.'});
    });
  }else{
    return res.status(200).json({data: cachedData});
  }
});

app.listen('8090');