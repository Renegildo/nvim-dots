require("config.lazy")

local set = vim.opt
set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.cursorline = true

-- --------- --
-- CLIPBOARD --
-- --------- --
vim.opt.clipboard = "unnamedplus"
if vim.fn.has('wsl') == 1 then
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Yank', { clear = true }),
    callback = function()
      vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,
  })
end

-- ------- --
-- WINDOWS --
-- ------- --
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- --- --
-- LSP --
-- --- --
vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("n", "gd", "<C-]>")
vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)

-- ---- --
-- TABS --
-- ---- --
vim.keymap.set("n", "<tab>", ":tabn<CR>")
vim.keymap.set("n", "<S-tab>", ":tabp<CR>")

-- -------- --
-- QUICKFIX --
-- -------- --
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- ---------- --
-- APPEARANCE --
-- ---------- --

-- Just a reserved space

-- ---- --
-- MISC --
-- ---- --
vim.keymap.set("n", "<space>h", "<cmd>nohlsearch<CR>")       -- unhighlight search
vim.keymap.set("n", "<space><space>x", "<cmd> source %<CR>") -- source configuration file
vim.keymap.set("n", "<space>w", ":w<CR>")                    -- easy shortcut for saving
vim.api.nvim_create_autocmd("TextYankPost", {                -- highlight text when yaking
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {}) -- setting theme correct colors
end
