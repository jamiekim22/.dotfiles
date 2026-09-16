return {
	"loctvl842/monokai-pro.nvim",
	config = function()
		require("monokai-pro").setup({
			transparent_background = true,
			override = function()
				return {
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },
				}
			end,
		})
	end,
}
