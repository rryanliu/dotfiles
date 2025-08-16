-- Set tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true

-- Default split behavior
vim.o.splitright = true

-- Python host program
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- this is alr in statusline
vim.o.showmode = false

-- undo history
vim.o.undofile = true

-- highlight the curr line?
-- vim.o.cursorline = true -- nah
vim.o.scrolloff = 10

-- clear highlights by pressing esc in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
