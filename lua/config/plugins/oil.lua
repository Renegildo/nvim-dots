return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      vim.keymap.set("n", "<space>q", "<cmd>Oil<CR>")
      vim.keymap.set("n", "-", "<cmd>Oil .<CR>")
      require("oil").setup {
        view_options = {
          show_hidden = true,
        },
        watch_for_changes = true,
        confirmation = {
          border = "none",
        },
      }
    end
  }
}
