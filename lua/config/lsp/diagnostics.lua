-- lua/plugins/lsp/diagnostics.lua
local M = {}

M.setup = function()
  -- Configuración visual de diagnósticos
  vim.diagnostic.config({
    virtual_text = {
      spacing = 4,
      prefix = "■",
      source = "always",
      format = function(diagnostic)
        return string.format(
          "%s (%s)",
          diagnostic.message,
          diagnostic.source
        )
      end,
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = "󰌵 ",
        [vim.diagnostic.severity.INFO] = " "
      }
    },
    underline = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
    float = {
      border = "rounded",
      header = "",
      source = "always",
      format = function(diagnostic)
        return string.format(
          "%s\n%s [%s]",
          diagnostic.message,
          diagnostic.source,
          diagnostic.code or diagnostic.user_data.lsp.code
        )
      end,
    },
    update_in_insert = false,
    severity_sort = true,
  })

  -- Mapeos globales para navegación de diagnósticos
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

  -- Personalización de símbolos
  local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " "
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return M
