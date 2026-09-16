return {
	"rose-pine/neovim",
	name = "rose-pine",
	-- priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "main", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = false,
			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true, -- Handle deprecated options automatically
			},
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			highlight_groups = {
				ColorColumn = { bg = "#1C1C21" },
				-- Editor matches the terminal; floats stay transparent
				Normal = { bg = "NONE" },
				NormalNC = { bg = "NONE" },
				SignColumn = { bg = "NONE" },
				NormalFloat = { bg = "NONE" },
				Pmenu = { bg = "#191724" }, -- Completion menu background
				PmenuSel = { bg = "#4a465d", fg = "NONE" }, -- Highlighted completion item
				FloatBorder = { bg = "NONE" },
				FloatTitle = { bg = "NONE" },
				-- PmenuSbar = { bg = "#191724" }, -- Scrollbar background
				-- PmenuThumb = { bg = "#9ccfd8" }, -- Scrollbar thumb
			},
			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",
				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",
				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		})

		-- HACK: set this on the color you want to be persistent
		-- when quit and reopening nvim
		-- vim.cmd("colorscheme rose-pine")
	end,
}
