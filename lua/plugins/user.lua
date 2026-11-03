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
      size = function(term)
        if term.direction == "horizontal" then
          return 17
        elseif term.direction == "vertical" then
          return 80
        end
      end,
      shade_terminals = false,
      shading_factor = 0,
      persist_size = true,
      shell = "nu",
    },
  },

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local astrocore = require "astrocore"

      local keys = opts.dashboard.preset.keys

      for i = #keys, 1, -1 do
        if keys[i].key == "s" then keys[i].action = "<Leader>S." end
      end

      keys[#keys + 1] = { icon = " ", key = "q", desc = "Quit", action = ":qa" }

      opts.dashboard = astrocore.extend_tbl(opts.dashboard, {
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
      })
      opts.indent = astrocore.extend_tbl(opts.indent, {
        enabled = false,
      })
    end,
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

  {
    "max397574/better-escape.nvim",
    opts = {
      mappings = {
        c = {
          j = {
            k = "<C-c>",
            j = "<C-c>",
          },
        },
        t = {
          j = {
            k = [[<C-\><C-n>]],
          },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      win = {
        no_overlap = false,
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      word_diff = true,
      on_attach = function(bufnr)
        local astrocore = require "astrocore"
        local astroui = require "astroui"
        local prefix, maps = "<Leader>g", astrocore.empty_map_table()
        for _, mode in ipairs { "n", "v" } do
          maps[mode][prefix] = { desc = astroui.get_icon("Git", 1, true) .. "Git" }
        end

        maps.n[prefix .. "l"] = { function() require("gitsigns").blame_line() end, desc = "View Git blame" }
        maps.n[prefix .. "L"] =
          { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }
        maps.n[prefix .. "p"] = { function() require("gitsigns").preview_hunk_inline() end, desc = "Preview Git hunk" }
        maps.n[prefix .. "r"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" }
        maps.v[prefix .. "r"] = {
          function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end,
          desc = "Reset Git hunk",
        }
        maps.n[prefix .. "R"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" }
        maps.n[prefix .. "s"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage/Unstage Git hunk" }
        maps.v[prefix .. "s"] = {
          function() require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" } end,
          desc = "Stage Git hunk",
        }
        maps.n[prefix .. "S"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" }
        maps.n[prefix .. "d"] = { function() require("diffview").toggle {} end, desc = "Toggle Diffview" }

        maps.n["[G"] = { function() require("gitsigns").nav_hunk "first" end, desc = "First Git hunk" }
        maps.n["]G"] = { function() require("gitsigns").nav_hunk "last" end, desc = "Last Git hunk" }
        maps.n["]g"] = { function() require("gitsigns").nav_hunk "next" end, desc = "Next Git hunk" }
        maps.n["[g"] = { function() require("gitsigns").nav_hunk "prev" end, desc = "Previous Git hunk" }
        for _, mode in ipairs { "o", "x" } do
          maps[mode]["ig"] = { ":<C-U>Gitsigns select_hunk<CR>", desc = "inside Git hunk" }
        end

        astrocore.set_mappings(maps, { buffer = bufnr })
      end,
    },
  },

  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        list = {
          selection = {
            -- auto_insert = false,
          },
        },
        menu = {
          -- auto_show = true,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
          },
        },
        documentation = {
          --[[ draw = function(opts)
            opts.default_implementation()
          end, ]]
        },
        ghost_text = {
          -- enabled = true,
        },
      },
      cmdline = {
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          menu = {
            auto_show = true,
          },
        },
      },
    },
  },
}
