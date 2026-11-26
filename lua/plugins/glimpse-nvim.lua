local utils = require "utils"

---@type LazySpec
return {
  -- "adriancmiranda/glimpse.nvim",
  "Benjas333/glimpse.nvim",
  branch = "fix/windows",
  enabled = utils.os.name == "linux",
  ft = { "oil", "neo-tree" },
  ---@module "glimpse"
  ---@type GlimpseConfig
  opts = {
    -- strategy = "inline",
    auto_open = true,
    auto_refresh = true,
    integrations = {
      neotree = {
        -- enable = true,
      },
      telescope = {
        enable = true,
      },
    },
  },
}
