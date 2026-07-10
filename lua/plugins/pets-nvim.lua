local utils = require "utils"

---@type LazySpec
return {
  "giusgad/pets.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "giusgad/hologram.nvim",
  },
  opts = {},
  enabled = utils.os.name == "linux",
}
