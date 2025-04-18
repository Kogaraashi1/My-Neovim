-- ~/.config/nvim/lua/config/lsp/servers/bash.lua
return {
	setup = function(on_attach, capabilities)
		require("lspconfig").bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			-- opcional: trata también archivos zsh como shell
			filetypes = { "sh", "bash", "zsh" },
			root_dir = require("lspconfig.util").root_pattern(".git", vim.fn.getcwd()),
		})
	end,
}
