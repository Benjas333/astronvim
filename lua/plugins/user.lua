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
      default_component_configs = {
        indent = {
          indent_size = 3,
          padding = 0,
        },
      },
      window = {
        position = "right",
        width = 40,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_hidden = false,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd [[setlocal relativenumber]]
            vim.cmd [[setlocal number]]
          end,
        },
      },
    },
  },

  ---@type LazySpec
  {
    "akinsho/toggleterm.nvim",
    opts = {
      -- shade_terminals = false,
      persist_size = true,
      shell = "nu",
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
