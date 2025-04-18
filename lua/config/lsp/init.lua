-- config/lsp/init.lua
local M = {}

function M.setup()
  require("config.lsp.diagnostics").setup()
  require("config.lsp.mason").setup()
  require("config.lsp.conform").setup()
  require("config.lsp.lint").setup()
  require("config.lsp.core").setup_servers()
end

return M
