/**
 *  wfData,
 *  Copyright (C) 2017 Ilkka Kuosmanen
 *
 *  This file is part of wfData.
 *
 *  wfData is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  wfData is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with wfData.  If not, see <http://www.gnu.org/licenses/>.
 */
'use strict';
const spawn = require('child_process').spawn;
function getData (input) {
  return new Promise((resolve, reject) => {
    let luaToJson = spawn('./lua/lua_bin/lua53.exe', ['./lua/lua_bin/luaObjectToJson.lua']);

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
      return resolve(JSON.parse(data));
    });
  });
}

module.exports = getData;