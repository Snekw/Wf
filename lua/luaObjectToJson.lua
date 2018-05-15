--
--  wfApi,
--  Copyright (C) 2018 Ilkka Kuosmanen
--
--  This file is part of wfApi.
--
--  wfApi is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  wfApi is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with wfApi.  If not, see <http://www.gnu.org/licenses/>.
--

local json = require "json"

local data = io.read("*a")
local f = load(data)
local s = f()
local j = json.encode(s)
io.write(j)
