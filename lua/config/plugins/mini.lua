return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require "mini.statusline"
      statusline.setup { use_icons = true }

      local animate = require "mini.animate"
      animate.setup {}
    end
  }
}
