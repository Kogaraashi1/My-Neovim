-- plugins/lsp/conform.lua (nueva sintaxis)
local M = {}

M.setup = function()
  require("conform").setup({
    formatters_by_ft = {
      python = { { "black", stop_after_first = true } },  -- Sintaxis actualizada
      lua = { "stylua" },
      go = { "gofmt", "goimports" }
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    }
  })
end

return M
