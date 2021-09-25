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
"use strict";
const spawn = require("child_process").spawn;
const CustomError = require("../error").CustomError;

function getData(input, dependencies) {
  return new Promise((resolve, reject) => {
    let luaCmd = "lua5.3";
    let luaParams = ["./luaObjectToJson.lua"];
    if (process.platform === "win32") {
      luaCmd = "./lua53.exe";
    }
    let luaToJson = spawn(luaCmd, luaParams, { cwd: __dirname });

    // Change the sparse arrays that can contain a negative index to string keys.
    let r = /\[([-\d]{1,2})\]/g;
    input = input.replace(r, '["$1"]');
    let removeNull = /local null = {}.*$/gim;
    input = input.replace(removeNull, "");
    let removeNull2 = /null = null.*$/gim;
    input = input.replace(removeNull2, "");
    let removeComments = /--.*$/gim;
    input = input.replace(removeComments, "");
    let replaceModuleShared = /require\(\'Module:Shared\'\)/gim;
    input = input.replace(replaceModuleShared, "require('shared')");
    let replaceModuleTable = /require\(\'Module:Table\'\)/gim;
    input = input.replace(replaceModuleTable, "require('module_table')");

    // dependency to "Warframes" cache from "WarframesConclave" cache
    if (dependencies) {
      let replaceDependency = /mw\.loadData\([\'\"](.*)[\'\"]\)/gim;
      let result;
      while ((result = replaceDependency.exec(input)) !== null) {
        const dependency = dependencies.find((v) => v.module === result[1]);
        input = input.replace(
          `mw.loadData('${dependency.module}')`,
          dependency.cache.src.replace('return', '')
        );
      }
    }

    let replaceVersion2 = /return VersionData/gim;
    input = input.replace(
      replaceVersion2,
      `
  for i, up in ipairs(VersionData.Versions) do
	if VersionData.Versions[i][1] then
		VersionData.Versions[i][1] = nil
	end
end
  return VersionData`
    );
    let replaceMission2 = /return MissionData/gim;
    input = input.replace(
      replaceMission2,
      `
      MissionData.by = nil
      MissionData.dictionary = nil
      MissionData.vars = nil
      return MissionData`
    );
    input = input.replace(
      /MissionData.vars\n\s*{\n\s*'Node',\n\s*'Enemy',\n\s*'Planet',\n\s*'Type',\n\s*'Tileset',\n\s*'Tier',\n\s*'LinkName',\n\s*'Drops',\n\s*'Pic',\n\s*'ObjectiveDetails',\n\s*}/gim,
      "MissionData.vars"
    );

    luaToJson.stderr.pipe(process.stderr);
    luaToJson.stdin.setEncoding("utf-8");
    luaToJson.stdin.write(input);
    luaToJson.stdin.end();

    let data = "";
    luaToJson.stdout.on("data", (d) => {
      data += d;
    });
    let err = "";
    luaToJson.stderr.on("data", (d) => {
      err += d;
    });
    luaToJson.stderr.on("end", (d) => {
      if (err.length > 0) {
        return reject(err);
      }
    });
    luaToJson.stdout.on("end", (c) => {
      let d = "";
      if (data.length === 0) {
        return reject(new CustomError("Lua parsing failed."));
      }
      try {
        d = JSON.parse(data);
        return resolve(d);
      } catch (e) {
        return reject(e);
      }
    });
  });
}

module.exports = getData;
