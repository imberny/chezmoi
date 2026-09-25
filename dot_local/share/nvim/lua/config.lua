-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
--
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- OPTIONS
--
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

vim.o.number = true -- Show line numbers in a column.

-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function() vim.o.clipboard = "unnamedplus" end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tab settings (check out https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd)
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- Use value of shiftwidth

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list = true -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true

-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Quit
vim.keymap.set({ "n" }, "<leader>q", ":qa<cr>", { desc = "Quit Neovim", silent = true })
-- Navigate splits
vim.keymap.set({ "n" }, "<C-h>", ":wincmd h<cr>", { silent = true })
vim.keymap.set({ "n" }, "<C-j>", ":wincmd j<cr>", { silent = true })
vim.keymap.set({ "n" }, "<C-k>", ":wincmd k<cr>", { silent = true })
vim.keymap.set({ "n" }, "<C-l>", ":wincmd l<cr>", { silent = true })
-- -- Splits visuals
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ff007c", bold = true })
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  -- callback = function()
    -- vim.opt_local.winhighlight = "Normal:Normal,NormalNC:Normal"
  -- end,
-- })
-- oil.nvim mappings
vim.keymap.set({ "n" }, "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
-- Move Lines
vim.keymap.set({ "n" }, "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up", silent = true })
vim.keymap.set({ "n" }, "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down", silent = true })
vim.keymap.set({ "i" }, "<A-k>", "<cmd>m .-2<cr>==gi", { desc = "Move Up", silent = true })
vim.keymap.set({ "i" }, "<A-j>", "<cmd>m .+1<cr>==gi", { desc = "Move Down", silent = true })
vim.keymap.set({ "v" }, "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up", silent = true })
vim.keymap.set({ "v" }, "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down", silent = true })
-- Put below
vim.keymap.set({ "n" }, "P", "<cmd>pu<cr>", { desc = "Put below current line", silent = true })
-- Save buffer
vim.keymap.set({ "n" }, "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save buffer", silent = true })
vim.keymap.set({ "i" }, "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save buffer", silent = true })
vim.keymap.set({ "v" }, "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save buffer", silent = true })

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function() vim.hl.on_yank() end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command("GitBlameLine", function()
  local line_number = vim.fn.line "." -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ "git", "blame", "-L", line_number .. ",+1", filename }):wait().stdout)
end, { desc = "Print the git blame for the current line" })

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd "packadd! nohlsearch"

require "config.lazy"

