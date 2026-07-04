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

  {
    "AstroNvim/astrolsp",
    config = function(plugin, opts)
      require("astrolsp").setup(opts)

      local disabled_roots = {
        [vim.fs.normalize "D:/VisualStudioCode/"] = true,
        [vim.fs.normalize "C:/Users/sesto/Documents/Vencord/"] = true,
      }

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        callback = function(args)
          local buf = args.buf
          local name = vim.api.nvim_buf_get_name(buf)
          if name == "" then return end

          local cwd = vim.fs.normalize(vim.fn.getcwd(-1, -1))
          for disabled_root in pairs(disabled_roots) do
            if cwd:find(disabled_root, 1, true) and vim.b[buf].autoformat == nil then vim.b[buf].autoformat = false end
          end
        end,
      })
    end,
  },
}
