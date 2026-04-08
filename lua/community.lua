-- if true then return {} end

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.bluloco-nvim" },

  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },

  -- { import = "astrocommunity.media.pets-nvim" },
  { import = "astrocommunity.media.cord-nvim" },
  { import = "astrocommunity.media.codesnap-nvim" },

  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.workflow.precognition-nvim" },

  -- { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cs-omnisharp" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.markdown" },
}
