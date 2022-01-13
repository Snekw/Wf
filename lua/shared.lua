local p = {}
function p.contains(list, item, ignoreCase)
    if (list == nil or item == nil) then 
        return false 
    end
    if (ignoreCase == nil) then 
        ignoreCase = false 
    end
    if (type(list) == "table") then
        for _, value in pairs(list) do
            if (value == item) then
                return true
            elseif (ignoreCase and string.upper(value) == string.upper(item)) then
                return true
            end
        end
    else
        local start = string.find(list, item)
        return start ~= nil
    end
    return false
end

return p