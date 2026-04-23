-- if true then return end

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Trigger :GuessIndent on LSP load and on AstroFormat
local augroup = vim.api.nvim_create_augroup("AutoGuessIndent", { clear = true })
local function reload_indentation() require("guess-indent").set_from_buffer(nil, nil, true) end

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = reload_indentation,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "AstroFormat",
  group = augroup,
  callback = reload_indentation,
})

-- Treesitter env variable
vim.fn.setenv("CC", "clang")
