return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"IndentColor",
			}

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IndentColor", { fg = "#434a52" })
			end)

			require("ibl").setup({
				indent = { highlight = highlight, char = "│" },
				scope = {
					enabled = false,
				},
			})
		end,
	},
}
