local M = {}

M.path = "../db/food_logs.csv"

local path = M.path

local db = require("src.db")

function M.get(search_term)
	return db.get_from_db(path, search_term)
end

function M.add(text)
	db.add_to_db(path, text)
end

function M.delete(index)
	db.delete_from_db(path, index)
end

return M
