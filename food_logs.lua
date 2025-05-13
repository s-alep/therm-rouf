M = {}

M.path = "./food_logs.csv"

local path = M.path

local db = require("db")

function M.get(search_term)
	return db.get_from_db(M.path, search_term)
end

function M.add(text)
	db.add_to_db(path, text)
end

function M.delete(index)
	db.delete_from_db(path, index)
end

return M
