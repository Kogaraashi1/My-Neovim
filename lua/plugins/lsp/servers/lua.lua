local M = {}
local vim = vim

M.setup = function(on_attach, capabilities)
	require("lspconfig").lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
					special = {
						reload = "require", -- Permite reload con require
					},
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						-- Si usas plugins externos, añade sus rutas:
						-- "${3rd}/luv/library"
					},
					maxPreload = 50, -- Aumentado para proyectos grandes
					preloadFileSize = 25,
				},
				telemetry = { enable = false },
				hint = {
					enable = true,
					arrayIndex = "Disable",
					paramType = true,
					paramName = "All", -- Nuevo
					setType = true,
				},
				diagnostics = {
					enable = true,
					globals = { "vim" },
					disable = {
						"missing-parameter",
						"trailing-space",
						"redundant-parameter",
						"undefined-doc-name",
						"unused-local", -- Nuevo
						"missing-fields",
						"mixed-table",
					},
					groupSeverity = {
						strong = "Warning", -- Personalización de severidad
						strict = "Error",
					},
				},
			},
		},
	})
end

return M
