local prefix = "<Leader>r"

local commands = {
  [prefix] = { desc = " Refactoring" },
  [prefix .. "e"] = { ":Refactor extract ", desc = "Extract Function" },
  [prefix .. "f"] = { ":Refactor extract_to_file ", desc = "Extract Fuction To File" },
  [prefix .. "v"] = { ":Refactor extract_var ", desc = "Extract Variable" },
  [prefix .. "i"] = { ":Refactor inline_var<CR>", desc = "Inline Variable" },
  [prefix .. "I"] = { ":Refactor inline_func<CR>", desc = "Inline Function" },
  [prefix .. "b"] = { desc = " Block" },
  [prefix .. "bb"] = { ":Refactor extract_block<CR>", desc = "Extract Block" },
  [prefix .. "bf"] = { ":Refactor extract_block_to_file<CR>", desc = "Extract Block To File" },
}

---@type LazySpec
return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "lewis6991/async.nvim",
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          x = commands,
          n = commands,
        },
      },
    },
  },
  lazy = false,
  opts = {},
}
