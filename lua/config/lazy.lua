local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " " -- Leader key is <space>
vim.g.maplocalleader = "\\"

require("lazy").setup({ -- Loading catppuccin theme
  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "mocha",
          transparent_background = false,
          term_colors = true,
          dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
          },

          no_italic = false,
          no_bold = false,
          no_underline = false,

          styles = {
            comments = { "italic" },
            conditionals = { "italic" },
          },

          default_integrations = false,
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            lsp_trouble = true,
            telescope = { enabled = true, style = "nvchad" },
          },

          color_overrides = {
            all = {
              rosewater = "#f5e0dc",
              flamingo = "#f2cdcd",
              pink = "#f5c2e7",
              mauve = "#cba6f7",
              red = "#f38ba8",
              maroon = "#eba0ac",
              peach = "#fab387",
              yellow = "#f9e2af",
              green = "#a6e3a1",
              teal = "#94e2d5",
              sky = "#89dceb",
              sapphire = "#74c7ec",
              blue = "#89b4fa",
              lavender = "#b4befe",
              text = "#cdd6f4",
              subtext1 = "#bac2de",
              subtext0 = "#a6adc8",
              overlay2 = "#9399b2",
              overlay1 = "#7f849c",
              overlay0 = "#6c7086",
              surface2 = "#585b70",
              surface1 = "#45475a",
              surface0 = "#313244",
              base = "#1e1e2e",
              mantle = "#181825",
              crust = "#11111b",
            },
          },
        })

        vim.cmd [[ colorscheme catppuccin-mocha ]]
      end,
    },
    {
      import = "config.plugins",
    },
  },
  change_detection = {
    enabled = false,
    notify = false,
  }
})
