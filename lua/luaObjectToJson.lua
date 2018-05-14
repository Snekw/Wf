local json = require "json"

local data = io.read("*a")
local f = load(data)
local s = f()
local j = json.encode(s)
io.write(j)
