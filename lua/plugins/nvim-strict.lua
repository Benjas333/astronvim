---@type LazySpec
return {
  -- "emileferreira/nvim-strict",
  -- commit = "cba2f989b66edd04181247f5cc25dcf36d556a80",
  "Benjas333/nvim-strict",
  branch = "fix-highlight",
  opts = {
    deep_nesting = {
      -- highlight_group = "Substitute",
      depth_limit = 4,
    },
    overlong_lines = {
      length_limit = 125,
      split_on_save = false,
    },
    tab_indentation = {
      convert_on_save = false,
    },
    todos = {
      highlight = false,
    },
  },
}
