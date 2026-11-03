---@type vim.lsp.Config
return {
  settings = {
    yamlls = {
      filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.ghactions", "yaml.helm-values" },
    },
  },
}
