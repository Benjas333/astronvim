local LEGACY_CONFIG_FILENAMES = {
  -- ESLint <=8 (Deprecated)
  ".eslintignore",
  ".eslintrc",
  ".eslintrc.cjs",
  ".eslintrc.js",
  ".eslintrc.json",
  ".eslintrc.yaml",
  ".eslintrc.yml",
}

local FLAT_CONFIG_FILENAMES = {
  -- ESLint >=9
  "eslint.config.cjs",
  "eslint.config.cts",
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.mts",
  "eslint.config.ts",
}

local ESLINT_FILES = vim.list_extend(vim.deepcopy(FLAT_CONFIG_FILENAMES), LEGACY_CONFIG_FILENAMES)

local function resolve_eslint_dir(bufnr)
  local path = vim.fs.root(bufnr, ESLINT_FILES)
  return vim.fs.dirname(path)
end

local function resolve_package_json_dir(bufnr)
  local path = vim.fs.root(bufnr, { "package.json" })
  return vim.fs.dirname(path)
end

local function resolve_git_dir(bufnr)
  local path = vim.fs.root(bufnr, { ".git" })
  return vim.fs.dirname(path)
end

local function resolve_workspace_dir(bufnr)
  local eslint_dir = resolve_eslint_dir(bufnr)
  local package_json_dir = resolve_package_json_dir(bufnr)
  local git_dir = resolve_git_dir(bufnr)
  return eslint_dir or package_json_dir or git_dir or vim.fn.getcwd()
end

---@type LazySpec
return {
  {
    "esmuellert/nvim-eslint",
    -- enabled = false,
    opts = {
      root_dir = function(bufnr) return resolve_workspace_dir(bufnr) end,
      settings = {
        workingDirectory = {
          mode = "auto",
        },
        workspaceFolder = function(bufnr)
          local worspace_dir = resolve_workspace_dir(bufnr)

          return {
            uri = vim.uri_from_fname(worspace_dir),
            name = vim.fn.fnamemodify(worspace_dir, ":t"),
          }
        end,
      },
    },
  },
  {
    "nvim-mini/mini.icons",
    optional = true,
    opts = function(_, opts)
      opts.file = opts.file or {}
      for _, filename in ipairs(ESLINT_FILES) do
        opts.file[filename] = { glyph = "󰱺", hl = "MiniIconsYellow" }
      end
    end,
  },
}
