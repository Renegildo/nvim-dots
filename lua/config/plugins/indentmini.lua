return {
  "nvimdev/indentmini.nvim",
  config = function()
    require("indentmini").setup()
    vim.cmd.highlight('IndentLine guifg=#24273a')
    vim.cmd.highlight('IndentLineCurrent guifg=#303446')
  end,
}
