local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, win_opts)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end

  vim.cmd("normal i")
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set({ "n", "t" }, "<M-3>", toggle_terminal, { noremap = true, silent = true })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
