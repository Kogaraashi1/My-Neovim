local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          diagnosticSeverityOverrides = {
            reportUnusedVariable = "warning",  -- Personalización adicional
            reportMissingImports = "error"
          }
        }
      }
    }
  })
end

return M
