return {
	"mawkler/modicator.nvim",
	event = "VeryLazy",
	opts = {
		show_warnings = false,
		highlights = {
			defaults = {
				bold = true,
				italic = false,
			},
		},
		integration = {
			lualine = {
				enabled = true,
				highlight = "bg",
			},
		},
	},
}
