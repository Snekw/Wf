--	'''Table''' is an extension of the <code>table</code> STL, containing additional functionality 
--	and support.<br/ >
--	
--	Table can only be used within other modules. It is not recommended to invoke
--	these functions within articles or templates.
--	
--	All table STL objects can be accessed directly, e.g. <code>table.concat()</code>.
--	
--	@module		table
--	@alias		p
--	@author		Various
--	@author		[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Cephalon Scientia|User:Cephalon Scientia]]
--	@attribution	[[User:FINNER|FINNER]]
--	@image		ModuleTable.png
--	@release	beta
--	<nowiki>

-- May implement some useful functions from https://developer.roblox.com/en-us/api-reference/lua-docs/table

-- TODO: Add reverse mapping function for simple key-value pairs, returning a 
-- new table with key-value pairs reversed? This is to allow two-way lookup, 
-- assuming values are unique. Altenatively, add a function
-- to do a reverse table lookup (e.g. findKey(value)), but I think making a 
-- duplicate table with key-value pairs reversed is better.

-- TODO: In what instances do we just need to count the indexed elements of a table?
-- Ideally, if there is a table that have indexed elements and key-value pairs, we should
-- split its contents into two tables: one that acts like an array and the other a dictionary/map.

local function clone(t1)
	local t2 = {}
	for k, v in ipairs(t1) do
		if type(v) == "table" then t2[k] = clone(v)
		else t2[k] = v end
	end
	for k, v in pairs(t1) do
		if type(v) == "table" then t2[k] = clone(v)
		else t2[k] = v end
	end
	return t2
end

local table = {
	--  All Table STL functions  ----------------------------------------------------
	-- https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Table_library
	__concat = table.concat,	-- concatenate indexed values
	__insert = table.insert,	-- add element, increment higher keys
	__remove = table.remove,	-- delete item, move higher keys
	__maxn = table.maxn,	-- deprec?, largest number key
	__sort = table.sort,	-- modified merge sort
	-- Depreciated functions:
	-- table.foreach()	- use for loop with pairs() instead
	-- table.foreachi()	- use for loop with ipairs() instead
	-- table.getn()	- use length operator (#) instead or Table.size() for tables loaded through mw.loadData()
	concat = table.concat,
	insert = table.insert,
	remove = table.remove,
	-- sort   = table.sort,	-- Overridden to support function chaining/tail calls
	
	deepCopy = function(t1)
		if getmetatable(t1).mw_loadData then
			return clone(t1)
		end
		return mw.clone(t1)
	end,
}

---	Inverts a table to be indexed by a specified first-depth key.
--	<pre>
--	{
--		t1 = {
--			Value = "Some value",
--			NestedTable = {
--				NestedValue = "Another value"
--			}
--		}
--	}
--	becomes the following if using Value as inverted key
--	{
--	["Some value"] = {
--		Value = "Some value",
--		NestedTable = {
--			NestedValue = "Another value"
--		}
--	}
--	</pre>
--	@function		p.loadData
--	@param			{string} t Input table with table values or keys that map to table values (unmodified)
--	@param			{string} keyName Name of key to use as inverted index
--	@return			{table} Resultant table
function table.invertIndex(t, keyName)
	assert(type(t) == 'table', 'table.invertIndex(t, keyName): t must be a table')
	local temp = {}
	for k, v in pairs(t) do
		local keyValue = v[keyName]
		if (keyValue ~= nil) then
			if (temp[keyValue] == nil) then
				temp[keyValue] = {}
			end
			table.insert(temp[keyValue], v)
		end
	end
	return temp
end

---	Loads a copy of a data table. Being a copy, it is no longer readonly.
--	@function		p.loadData
--	@param			{string} t Location of data table ([[Module:<Module>/data]] usually)
--	@return			{table} Copy of data table
function table.loadData(t)
	return table.deepCopy(mw.loadData(t))
end

---	Sorts an array.
--	@function		p.sort
--	@param			{table} t Array-like table to be sorted
--	@param[opt]		{function} f Comparator function that takes in two arguments and returns a boolean;
--							   if omitted, uses default less-than operation when comparing two values
--	@return			{table} Sorted table for function chaining or tail call
function table.sort(t, f)
	table.__sort(t, f)
	return t
end

---	Copying key-value pairs to target table from reference table, ignoring table values.
--	Assumes that tables only contain table entries. Keys that are already in target table
--	will not be overrided with data from reference table.
--	@function		p.copyKeyValues
--	@param			{table} targetTable Table to be modified
--	@param			{table} refTable Reference table
--	@param			{table} keyTable Table of key names to copy within each table entry
--	@return			{table} Modified target table
function table.copyKeyValues(targetTable, refTable, keyTable)
	for k, v in pairs(targetTable) do
		local targetTableEntry = targetTable[k]
		local refTableEntry = refTable[k]
		for _, key in ipairs(keyTable) do
			-- Ignoring table values due to presense of metatables when mw.loadData()
			-- which means returned table cannot be exported out to other modules w/o
			-- require() (not good for performance)
			-- Though we can copy table values if we table.deepCopy()/table.loadData()
			if (targetTable[key] == nil and type(refTableEntry[key]) ~= 'table') then
				targetTableEntry[key] = refTableEntry[key]
			end
		end
	end
	return targetTable
end

---	Iterator sorted by keys.<br />
--	For example, a table that looked something like<br />
--	`data = {["Cat"] = 5, ["Bat"] = 4, ["Hat"] = 7 }`<br />
--	then<br />
--	`for k, v in skpairs(data) do`<br />
--	would loop through:<br />
--	k="Bat" v=4;<br />
--	k="Cat" v=5;<br />
--	k="Hat" v=7 <br />
--	redone by [[user:gigamicro]]
--	@function		table.skpairs
--	@param			{table} t A table to be sorted
--	@param[opt]		{boolean or function} sortType If true, sort by descending order; ascending otherwise; can also pass a function
--	@return			{function} For loop initialising values
--	@return			{table} Two element table with table values, the first maps keys to their array index and the second is an array of key names
--	@return			{string} Starting key
function table.skpairs(t, sortType)
	assert(type(t) == 'table', 'table.skpairs(t[, sortTable]): t must be a table')
	
	local keys = {}
	for k in pairs(t) do keys[#keys + 1] = k end
	
	if type(sortType) == 'function' then
		table.sort(keys, sortType)--custom sort (always applied to keys)
	elseif sortType then--descending
		table.sort(keys, function(a, b) return a > b end)
	else
		table.sort(keys)--implicit <, function(a, b) return a < b end)>
	end
	
	local keysIndex = {}
	for i, k in ipairs(keys) do
		keysIndex[k] = i
	end
	
	return function(tab, k)
		local key = tab[2][(tab[1][k] or 0) + 1]
		return key, t[key]
	end, {keysIndex, keys}, startingkey
end

---	Returns the number of elements/entries in a table.
--	@function		table.size
--	@param			{table} table A table with no explicit nil values
--	@return			{number} The size of table, ignoring keys with nil values and 
--							 nil values themselves
function table.size(t)
	assert(type(t) == 'table', 'table.size(t): t must be a table')
	local count = #t or 0
	if count ~= 0 then return count end
	for _ in pairs(t) do count = count + 1 end
	return count
end

---	Returns the number of indexed elements in a table.
--	@function		table.indexCount
--	@param			{table} t A table with no explicit nil values
--	@return			{number} The number of indexed elements in a table; 
--							 if table is not of type 'table' then return nil
--	@return			{number} Largest index (not necessarily the same as count since tables can be non-contiguous arrays)
function table.indexCount(t)
	assert(type(t) == 'table', 'table.indexCount(t): t must be a table')
	local count, max = 0, nil
	for i in ipairs(t) do count, max = count + 1, i end
	return count, max
end

---	Sorts a table based on the listed column.
--	@function		table.tableSort
--	@param			{table} t Table to be sorted
--	@param			{string} sortCol Name of column to be sorted by
--	@param			{boolean} sortAscend If true, sorts in ascending order by specified column; false otherwise
--	@return			{table} Sorted table
function table.tableSort(t, sortCol, sortAscend)
	assert(type(t) == 'table', 'table.tableSort(t, sortCol, sortAscend): t must be a table')
	return table.sort(t, 
		sortAscend 
		and function(a, b) return a[sortCol] < b[sortCol] end
		or function(a, b) return a[sortCol] > b[sortCol] end
	)
end

---	Checks if a string value is in a table, acting as an array.
--	@function		table.contains
--	@param			{table} t A table to be searched through
--	@param			{string} item The element that is being searched for
--	@param			{boolean} ignoreCase If false, search is case-sensitive; true otherwise
--	@return			{boolean} True if element exists in table, false otherwise
--	@return			{number} The found element's index; nil if element is not found
--	@return			{string} Value that is found, same as item; nil if element is not found
function table.contains(t, item, ignoreCase)
	assert(type(t) == 'table', 'table.contains(t, item, ignoreCase): t must be a table')
	if (t == nil or item == nil) then 
		return false
	end
	for k, value in pairs(t) do
		if (value == item) or (ignoreCase and string.upper(value) == string.upper(item)) then
			return true, k, value
		end
	end
	
	return false
end

---	Filters tables into subsets.
--	<br/>auth: [[User:gigamicro]]
--	@function		table.filter
--	@param			{table} t table in which to search
--	@param			{string or function} search String to search in table's keys
--	@return			{table} A subset of the original table where search(k, v, t) is true
function table.filter(t, search)
	assert(type(t) == 'table', 'table.filter(t, search): t must be a table')
	search = ({
		string = function(k)
			--if type(k)~='string' then error('Key '..type(k)..' not string') end
			return string.find(k, search) and true or false
		end,
		number = nil and function(k, v, t)
			return 
		end,
		table = nil and function(k, v, t)
		end,
	})[type(search)] or search

	if type(search) ~= 'function' then return end
	
	local out = {}
	for k, v in pairs(t) do
		if search(k, v, t) then
			out[k] = v
		end
	end
	return out
end

return table