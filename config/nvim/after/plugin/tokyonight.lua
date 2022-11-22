vim.opt.background = "dark"
require("tokyonight").setup({
    style = "moon",
    transparent = false,
    terminal_colors = true,
})

vim.cmd("colorscheme tokyonight")
