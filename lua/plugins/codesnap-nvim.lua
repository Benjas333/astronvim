if true then return {} end

local prefix = "<Leader>c"

---@type LazySpec
return {
  "mistricky/codesnap.nvim",
  tag = "v2.0.1",
  -- build = "make",
  cmd = {
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          v = {
            [prefix] = { desc = " CodeSnap" },
            [prefix .. "s"] = { ":CodeSnap<CR>", desc = "CodeSnap (clipboard)" },
            [prefix .. "S"] = { ":CodeSnapSave<CR>", desc = "CodeSnap (save)" },
            [prefix .. "h"] = { ":CodeSnapHightlight<CR>", desc = "CondeSnap with highlight (clipboard)" },
            [prefix .. "H"] = { ":CodeSnapSaveHighlight<CR>", desc = "CodeSnap with highlight (save)" },
          },
        },
      },
    },
  },
  opts = {
    -- show_line_number = true,
    snapshot_config = {
      window = {
        mac_window_bar = false,
      },
      code_config = {
        breadcrumbs = {
          -- enable = true,
        },
      },
      watermark = {
        content = "",
      },
    },
  },
}
