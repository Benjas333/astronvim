local utils = require "utils"

---@type LazySpec
return {
  {
    "RuizhePang/naudio.nvim",
    enabled = utils.os.name == "linux",
    dependencies = {
      {
        "3rd/image.nvim",
        build = false,
        ---@module "image"
        ---@type Options
        opts = {
          backend = "sixel",
          processor = "magick_cli",
          integrations = {
            markdown = {
              enabled = true,
              -- clear_in_insert_mode = false,
              -- only_render_image_at_cursor = false,
              only_render_image_at_cursor_mode = "popup",
            },
          },
          kitty_method = "normal",
        },
      },
    },
    opts = {},
  },
}
