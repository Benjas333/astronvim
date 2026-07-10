---@type LazySpec
return {
  {
    "esmuellert/nvim-eslint",
    -- enabled = false,
    opts = {
      workingDirectory = {
        mode = "auto",
      },
    },
  },
  {
    "nvim-mini/mini.icons",
    optional = true,
    opts = function(_, opts)
      opts.file = opts.file or {}
      local eslint_files = {
        -- ESLint <=8 (Deprecated)
        ".eslintignore",
        ".eslintrc",
        ".eslintrc.cjs",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        -- ESLint >=9
        "eslint.config.cjs",
        "eslint.config.cts",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.mts",
        "eslint.config.ts",
      }
      for _, filename in ipairs(eslint_files) do
        opts.file[filename] = { glyph = "󰱺", hl = "MiniIconsYellow" }
      end
    end,
  },
}
