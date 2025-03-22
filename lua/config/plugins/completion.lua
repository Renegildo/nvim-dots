return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    'xzbdmw/colorful-menu.nvim'
  },

  -- use a release tag to download pre-built binaries
  version = '*',
  enabled = true,
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {},
  config = function()
    require("blink.cmp").setup({
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = "default",
        ["<S-tab>"] = { 'select_prev', 'fallback' },
        ["<tab>"] = { 'select_next', 'fallback' },
        ["<CR>"] = { 'accept', 'fallback' },
        ["<down>"] = { 'scroll_documentation_down', 'fallback' },
        ["<up>"] = { 'scroll_documentation_up', 'fallback' },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- completion = {
      --   documentation = { auto_show = true, auto_show_delay_ms = 100 },
      --   menu = {
      --     border = "none",
      --     max_height = 15,
      --     direction_priority = { "s", "n" },
      --     draw = {
      --       padding = 2,
      --       gap = 2,
      --     },
      --   },
      -- },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      cmdline = {
        sources = {
          default = { "lsp", "path", "snippets", "buffer" }
        }
      },

      signature = { enabled = true },

      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
        menu = {
          max_height = 15,
          border = "none",
          draw = {
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
    })
  end
}
