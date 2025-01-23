return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TsUpdate",
    config = function()
      require("lazy").setup({ {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
          local configs = require("nvim-treesitter.configs")

          configs.setup({
            ensure_installed = { "c", "lua", "vimdoc", "query", "heex", "javascript", "html", "typescript" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
          })
        end
      } })
    end
  }
}
