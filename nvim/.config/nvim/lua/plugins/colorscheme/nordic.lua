return {
	"AlexvZyl/nordic.nvim",
	config = function()
		require("nordic").setup({
			italic_comments = true,
			transparent = {
				bg = true,
				float = true,
			},
		})
	end,
}
