local old_require = require
local log_file = io.open(vim.fn.stdpath("cache") .. "/nvim_load_log.txt", "w")

_G.require = function(modname)
	log_file:write("Requiriendo: " .. modname .. "\n")
	log_file:flush() -- Asegura que se escriba inmediatamente
	return old_require(modname)
end

vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		log_file:close()
	end,
})

return {}
