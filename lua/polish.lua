-- if true then return end

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Trigger :GuessIndent on LSP load and on AstroFormat
local augroup = vim.api.nvim_create_augroup("AutoGuessIndent", { clear = true })
local function reload_indentation(bufnr) require("guess-indent").set_from_buffer(bufnr, false, true) end

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args) reload_indentation(args.buf) end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "AstroFormat",
  group = augroup,
  callback = function(args) reload_indentation(args.buf) end,
})

-- Remove t from formatoptions
-- vim.api.nvim_create_autocmd("FileType", {
--   desc = "Avoid auto hard line wrap when writing",
--   pattern = "*",
--   callback = function() vim.opt_local.formatoptions:remove { "t", "a" } end,
-- })

-- Treesitter env variable
vim.fn.setenv("CC", "clang")
