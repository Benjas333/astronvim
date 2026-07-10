local utils = require "utils"
---@type LazySpec
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local hooks = require "ibl.hooks"

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF6682" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9C958" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#3892FF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF956B" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#3FC66C" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#A081FE" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#10B3FE" })
      vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#FF7AF8" })

      -- vim.api.nvim_set_hl(0, "RainbowDarkRed", { fg = "#401A21" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkYellow", { fg = "#3F3317" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkBlue", { fg = "#0F2540" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkOrange", { fg = "#40261C" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkGreen", { fg = "#11321C" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkViolet", { fg = "#292140" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkCyan", { fg = "#052E40" })
      -- vim.api.nvim_set_hl(0, "RainbowDarkPink", { fg = "#401F3F" })

      vim.api.nvim_set_hl(0, "RainbowDarkRed", { fg = "#803442" })
      vim.api.nvim_set_hl(0, "RainbowDarkYellow", { fg = "#7D652E" })
      vim.api.nvim_set_hl(0, "RainbowDarkBlue", { fg = "#1E4A80" })
      vim.api.nvim_set_hl(0, "RainbowDarkOrange", { fg = "#804B36" })
      vim.api.nvim_set_hl(0, "RainbowDarkGreen", { fg = "#216438" })
      vim.api.nvim_set_hl(0, "RainbowDarkViolet", { fg = "#514180" })
      vim.api.nvim_set_hl(0, "RainbowDarkCyan", { fg = "#0A5A80" })
      vim.api.nvim_set_hl(0, "RainbowDarkPink", { fg = "#803E7D" })
    end)

    vim.g.rainbow_delimiters = { highlight = utils.highlight }
    require("ibl").setup {
      indent = {
        highlight = utils.dark_highlight,
        tab_char = ".",
      },
      scope = {
        highlight = utils.highlight,
        -- highlight = "RainbowPink",
      },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
