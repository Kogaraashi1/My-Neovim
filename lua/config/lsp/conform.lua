-- config/lsp/conform.lua
local M = {}

M.setup = function()
	require("conform").setup({
		-- Si quieres que SOLO corra el primer formateador útil:
		stop_after_first = true,

		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},

		formatters_by_ft = {
			python = { "black" }, -- ya no va anidado
			lua = { "stylua" },
			go = { "gofmt", "goimports" },
		},
	})
end

return M
