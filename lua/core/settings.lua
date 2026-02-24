vim.cmd.colorscheme("nord")

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'  -- Set undo directory
