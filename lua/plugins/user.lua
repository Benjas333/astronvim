-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Overriding Plugins ==
  ---@type LazySpec
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function() vim.cmd [[setlocal relativenumber]] end,
        },
      },
    },
  },

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "███   ███████████   ",
            "███   █████████████ ",
            "███             ████",
            "███             ████",
            "███             ████",
            "███             ████",
            "███         ███████ ",
            "███   ███████████   ",
            "███   █████████████ ",
            "███             ████",
            "███             ████",
            "███             ████",
            "███             ████",
            "███         ███████ ",
            "███   ███████████   ",
          }, "\n"),
        },
      },
    },
  },
}
