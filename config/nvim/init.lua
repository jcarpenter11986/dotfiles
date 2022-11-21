require("plugins")


-- BASIC SETTINGS --
local bo = vim.bo
local cmd = vim.cmd
local g = vim.g
local o = vim.o

vim.g.mapleader = ' '

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.cursorline = true

o.hidden = true
o.ignorecase = true
o.spelllang = 'en_us'
cmd('autocmd filetype svn,*commit*,markdown setlocal spell') -- Enable spell check in some files

bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true

g.netrw_banner = 0


-- COLORSCHEME -- 
vim.opt.background = "dark"
require("tokyonight").setup({
    style = "moon",
    transparent = false,
    terminal_colors = true,
})

vim.cmd("colorscheme tokyonight")

require("lualine").setup{
    options = {
        theme = "tokyonight"
    }
}


-- FUZZY FINDER --
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.5 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- TREESITTER --
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}


-- LSP --
require('mason').setup()
