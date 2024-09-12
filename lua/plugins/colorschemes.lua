return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true, -- Enable transparent background
			terminal_colors = true, -- Use the same colors in Neovim terminal
			styles = {
				sidebars = "transparent", -- Transparent background for sidebars
				floats = "transparent", -- Transparent background for floating windows
			},
		})
		vim.cmd([[colorscheme solarized-osaka]])
	end,
}
