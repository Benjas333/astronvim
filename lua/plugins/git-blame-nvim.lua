---@type LazySpec
return {
  "f-person/git-blame.nvim",
  event = "User AstroGitFile",
  ---@module "gitblame"
  ---@type SetupOptions
  opts = {
    message_template = "  <author> (<date>), <summary>",
    date_format = "%r",
    -- max_commit_summary_length = 50,
    delay = 0,
    gitblame_set_extmark_options = {
      -- priority = 7,
    },
  },
}
