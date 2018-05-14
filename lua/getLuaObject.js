/**
 *  wfApi,
 *  Copyright (C) 2017 Ilkka Kuosmanen
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
const spawn = require('child_process').spawn;
function getData (input) {
  return new Promise((resolve, reject) => {
    let luaCmd = 'lua5.3';
    let luaParams = [ './luaObjectToJson.lua'];
    if(process.platform === "win32"){
      luaCmd = './lua53.exe';
    }
    let luaToJson = spawn(luaCmd, luaParams, {cwd: __dirname});

    luaToJson.stderr.pipe(process.stderr);
    luaToJson.stdin.setEncoding('utf-8');
    luaToJson.stdin.write(input);
    luaToJson.stdin.end();

    let data = '';
    luaToJson.stdout.on('data', (d) => {
      data += d;
    });
    let err = '';
    luaToJson.stderr.on('data', (d) => {
      err += d;
    });
    luaToJson.stderr.on('end', (d) => {
      return reject(err);
    });
    luaToJson.stdout.on('end', (c) => {
      let d = '';
      try {
        d = JSON.parse(data);
        return resolve(d);
      }catch (e) {
        return reject(e);
      }
    });
  });
}

module.exports = getData;