---@type vim.lsp.Config
return {
  settings = {
    basedpyright = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportAny = false,
          reportExplicitAny = false,
        },
      },
    },
  },
}
