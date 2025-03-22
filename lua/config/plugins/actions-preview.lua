return {
  "aznhe21/actions-preview.nvim",
  opts = {},
  config = function()
    local ap = require("actions-preview")
    vim.keymap.set({ "v", "n" }, "<leader>la", ap.code_actions)
  end
}
