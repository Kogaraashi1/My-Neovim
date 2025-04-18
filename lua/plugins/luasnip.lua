return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	main = "config.plugins.luasnip",
	dependencies = {
		"rafamadriz/friendly-snippets", -- paquetes VSCode
	},
	config = function()
		require("config.plugins.luasnip").setup()
		-- esto es lo que activa el lazy load de todos los snippets de friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
