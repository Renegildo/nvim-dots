return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      vim.keymap.set("n", "<space>sf", function()
        require("telescope.builtin").find_files {}
      end)

      vim.keymap.set("n", "<space>st", function()
        require("telescope.builtin").live_grep {}
      end)

      vim.keymap.set("n", "<space>sc", function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
    end
  }
}
