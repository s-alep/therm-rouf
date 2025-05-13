M = {}

local function get_next_index(db_path)
	local command = "wc -l " .. db_path .. ' |  sed "s/ .*//" '
	print(command)
	local handle = io.popen(command)
	if handle == nil then
		return nil
	end
	local result = handle:read("*a")
	handle:close()
	return tonumber(result)
end

function M.get_from_db(db_path, search_term)
	local command = "rg " .. search_term .. " " .. db_path
	local handle = io.popen(command)
	if handle == nil then
		return nil
	else
		local result = handle:read("*a")
		handle:close()
		return result
	end
end

function M.add_to_db(db_path, text)
	local index = get_next_index(db_path)
	if index == nil then
		return nil
	end
	print(index)
	local command = "echo " .. index .. "," .. text .. " >> " .. db_path
	local handle = io.popen(command)
	if handle == nil then
		return nil
	else
		local result = handle:read("*a")
		handle:close()
		return result
	end
end

function M.delete_from_db(db_path, index)
	local command = "sed -i '/^" .. index .. "/d' " .. db_path
	local handle = io.popen(command)
	if handle == nil then
		return nil
	else
		local result = handle:read("*a")
		handle:close()
		return result
	end
end

return M
