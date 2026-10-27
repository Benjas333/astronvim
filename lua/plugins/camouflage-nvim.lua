local prefix = "<Leader>M"

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
            [prefix] = { desc = " Camouflage" },
            [prefix .. "t"] = { "<cmd>CamouflageToggle<cr>", desc = "Toggle Camouflage" },

            [prefix .. "r"] = { "<cmd>CamouflageReveal<cr>", desc = "Reveal Line" },
            [prefix .. "y"] = { "<cmd>CamouflageYank<cr>", desc = "Yank Value" },
            [prefix .. "f"] = { "<cmd>CamouflageFollowCursor<cr>", desc = "Follow Cursor" },
          },
        },
      },
    },
  },
}
