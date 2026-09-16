return {
	"oskarnurm/koda.nvim",
	config = function()
		require("koda").setup({
			transparent = true,
			styles = {
				comments = { italic = true },
			},
			on_highlights = function(hl)
				hl.NormalFloat = { bg = "NONE" }
				hl.FloatBorder = { bg = "NONE" }
				hl.FloatTitle = { bg = "NONE" }
			end,
		})
	end,
}
