return {
  'numToStr/Comment.nvim',
  opts = {
  },
  config = function()
    require("Comment").setup({
      opleader = {
        line = "<space>/"
      },
      mappings = {
        basic = true,
        extra = false,
      },
    })
  end
}
