return {
	{
		"rachartier/tiny-cmdline.nvim",
		init = function()
			vim.o.cmdheight = 0
		end,
		config = function()
			require("tiny-cmdline").setup({
				width = { value = "60%" },
				position = {
					x = "50%",
					y = "93%",
				},
				-- blink.cmp owns its menu position; this keeps it attached to the cmdline window
				on_reposition = require("tiny-cmdline").adapters.blink,
			})
		end,
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		event = "LspAttach",
		opts = {
			backend = "vim",
			picker = "snacks",
		},
	},
}
