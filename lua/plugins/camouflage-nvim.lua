local prefix = "<Leader>m"

---@type LazySpec
return {
  "zeybek/camouflage.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = {
    "CamouflageToggle",
    "CamouflageReveal",
    "CamouflageYank",
    "CamouflageFollowCursor",
    "CamouflagePresent",
    "CamouflageShield",
    "CamouflageShieldPassword",
    "CamouflageAudit",
    "CamouflageStatus",
    "CamouflageInit",
    "CamouflageRegisters",
  },
  opts = {},
  -- keys = {
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix] = { desc = " CodeSnap" },
            -- { prefix .. "t", "<cmd>CamouflageToggle<cr>", desc = "Toggle Camouflage" },
            -- { prefix .. "r", "<cmd>CamouflageReveal<cr>", desc = "Reveal Line" },
            -- { prefix .. "y", "<cmd>CamouflageYank<cr>", desc = "Yank Value" },
            -- { prefix .. "f", "<cmd>CamouflageFollowCursor<cr>", desc = "Follow Cursor" },
            [prefix .. "s"] = { ":CodeSnap<CR>", desc = "CodeSnap (clipboard)" },
            [prefix .. "S"] = { ":CodeSnapSave<CR>", desc = "CodeSnap (save)" },
            [prefix .. "h"] = { ":CodeSnapHightlight<CR>", desc = "CondeSnap with highlight (clipboard)" },
            [prefix .. "H"] = { ":CodeSnapSaveHighlight<CR>", desc = "CodeSnap with highlight (save)" },
          },
        },
      },
    },
  },
}
