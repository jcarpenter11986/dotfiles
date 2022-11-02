local bo = vim.bo
local cmd = vim.cmd
local g = vim.g
local o = vim.o

--vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
o.hidden = true
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.cursorline = true

-- Use US English spelling dictionary
-- Use set spell to turn it on
o.spelllang = 'en_us'
-- Enable spell check in some file types
cmd('autocmd filetype svn,*commit*,markdown setlocal spell')

o.ignorecase = true

g.netrw_banner = 0
