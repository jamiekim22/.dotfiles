return {
	"nvim-mini/mini.surround",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		custom_surroundings = nil,
		-- INFO:
		-- saiw surround with no whitespace
		-- saw surround with whitespace
		mappings = {
			add = "sa", -- Add surrounding in Normal and Visual modes
			delete = "ds", -- Delete surroundng
			find = "sf", -- Find surrounding (to the right)
			find_left = "sF", -- Find surrounding (to the left)
			highlight = "sh", -- Highlight surrounding
			replace = "sr", -- Replace surrounding
			update_n_lines = "sn", -- Update `n_lines`

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},
	},
}
