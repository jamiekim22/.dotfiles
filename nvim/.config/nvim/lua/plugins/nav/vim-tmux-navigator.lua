return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "t" }, desc = "Window left" },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "t" }, desc = "Window down" },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "t" }, desc = "Window up" },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "t" }, desc = "Window right" },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = { "n", "t" }, desc = "Window previous" },
	},
}
