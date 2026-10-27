---@type LazySpec
return {
  "jake-stewart/multicursor.nvim",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Multicursor = "󰗧" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local mc = require "multicursor-nvim"

        for lhs, map in pairs {
          ["<C-LeftMouse>"] = { mc.handleMouse, desc = "Add cursor with mouse" },
          ["<C-LeftDrag>"] = { mc.handleMouseDrag, desc = "Add multiple cursors with mouse" },
          ["<C-LeftRelease>"] = { mc.handleMouseRelease, desc = "Add cursor with mouse" },
        } do
          maps.n[lhs] = map
        end

        local prefix = "<Leader>m"
        for lhs, map in pairs {
          ["<C-Down>"] = { function() mc.lineAddCursor(1) end, desc = "Add cursor and move down" },
          ["<C-Up>"] = { function() mc.lineAddCursor(-1) end, desc = "Add cursor and move up" },
          ["<C-A-Down>"] = { function() mc.lineSkipCursor(1) end, desc = "Move main cursor down" },
          ["<C-A-Up>"] = { function() mc.lineSkipCursor(-1) end, desc = "Move main cursor up" },

          ["<C-q>"] = { mc.toggleCursor, desc = "Toggle cursor" },

          [prefix] = { desc = require("astroui").get_icon("Multicursor", 1, true) .. "Multicursor" },

          [prefix .. "a"] = { mc.alignCursors, desc = "Align cursor columns" },
          [prefix .. "A"] = { mc.matchAllAddCursors, desc = "Add cursor matches" },
          [prefix .. "j"] = { function() mc.matchAddCursor(1) end, desc = "Add cursor and jump to next match" },
          [prefix .. "k"] = { function() mc.matchAddCursor(-1) end, desc = "Add cursor and jump to previous match" },
          [prefix .. "J"] = { function() mc.matchSkipCursor(1) end, desc = "Move cursor to next match" },
          [prefix .. "K"] = { function() mc.matchSkipCursor(-1) end, desc = "Move cursor to previous match" },
          [prefix .. "l"] = { rhs = mc.disableCursors, desc = "Lock cursors" },
          [prefix .. "x"] = { rhs = mc.deleteCursor, desc = "Delete actual main cursor" },
        } do
          maps.n[lhs] = map
          maps.x[lhs] = map
        end

        mc.addKeymapLayer(function(layerSet)
          for lhs, map in pairs {
            ["<C-Left>"] = { rhs = mc.prevCursor, desc = "Select previous cursor" },
            ["<C-Right>"] = { rhs = mc.nextCursor, desc = "Select next cursor" },
          } do
            layerSet({ "n", "x" }, lhs, map.rhs, { desc = map.desc })
          end

          layerSet("n", "<Esc>", function()
            if not mc.cursorsEnabled() then
              mc.enableCursors()
            else
              mc.clearCursors()
            end
          end)
        end)
      end,
    },
  },
  opts = {},
}
