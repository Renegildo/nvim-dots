return {
  "xiyaowong/nvim-cursorword",
  config = function()
    vim.cmd.highlight("default CursorWord cterm=underline gui=underline");
  end
}
