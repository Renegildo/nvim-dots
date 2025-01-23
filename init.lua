require("config.lazy")

local set = vim.opt
set.shiftwidth = 4
set.number = true
set.relativenumber = true

vim.keymap.set("n", "<space><space>x", "<cmd> source %<CR>")
vim.keymap.set("n", "<space>w", ":w<CR>")

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
-- resizing
vim.keymap.set("n", "+", ":res +5<CR>")
vim.keymap.set("n", "_", ":res -5<CR>")
-- moving around
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

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
