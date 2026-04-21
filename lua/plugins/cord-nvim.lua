---@type LazySpec
return {
  "vyfor/cord.nvim",
  opts = {
    editor = { tooltip = "A better distro than LazyVim lol" },
    buttons = {
      {
        label = function(opts) return opts.repo_url and "View Repository" or "View Project" end,
        url = function(opts) return opts.repo_url or "https://benjas333.github.io/Benjas333/" end,
      },
    },
    text = {
      workspace = function(opts) return "Working on " .. opts.workspace end,
    },
  },
}
