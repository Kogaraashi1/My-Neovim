-- plugins/lsp/lint.lua
local M = {}

M.setup = function()
	require("lint").linters_by_ft = {
		python = { "flake8" },
		lua = { "selene" },
		go = { "golangci-lint" },
		sh = { "shellcheck" },
		zsh = { "shellcheck" },
	}

	-- Elimina estas líneas ↓
	-- require("lint.linters.golangci-lint").cmd = "golangci-lint"
	-- require("lint.linters.golangci-lint").args = { "run", "--out-format=json" }

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return M
