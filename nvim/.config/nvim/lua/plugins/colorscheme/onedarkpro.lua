return {
	"olimorris/onedarkpro.nvim",
	config = function()
		require("onedarkpro").setup({
			styles = {
				comments = "italic",
			},
			highlights = {
				NormalFloat = { bg = "NONE" },
				FloatBorder = { bg = "NONE" },
				FloatTitle = { bg = "NONE" },
			},
			options = {
				transparency = true,
				terminal_colors = true,
			},
		})
	end,
}
