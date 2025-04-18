-- plugins/lsp/init.lua
local M = {}

function M.setup()
  require("plugins.lsp.diagnostics").setup()
  require("plugins.lsp.mason").setup()
  require("plugins.lsp.conform").setup()
  require("plugins.lsp.lint").setup()
  require("plugins.lsp.core").setup_servers()
end

return M
