-- ~/.config/nvim/lua/config/lsp/servers/zsh.lua
return {
	setup = function(on_attach, capabilities)
		-- No hay un LSP “zshls” muy establecido; normalmente reutilizamos bashls
		-- pero especificando solo “zsh” si lo prefieres:
		require("lspconfig").bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "zsh" },
			root_dir = require("lspconfig.util").root_pattern(".git", vim.fn.getcwd()),
		})
	end,
}
