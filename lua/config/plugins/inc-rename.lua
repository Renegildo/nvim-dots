return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
    vim.keymap.set("n", "<leader>lr", ":IncRename ")
  end,
}
