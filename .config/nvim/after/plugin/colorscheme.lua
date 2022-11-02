vim.opt.background = "dark"
require("tokyonight").setup({
    style = "storm",
    transparent = true,
    terminal_colors = true,
})

vim.cmd("colorscheme tokyonight")

require("lualine").setup{
    options = {
	theme = "tokyonight"
    }
}
