return {
	"kevinhwang91/nvim-hlslens",
	event = "VeryLazy",
	config = function()
		require("hlslens").setup()

		local opts = { noremap = true, silent = true }
		-- Keep zzzv from keymaps.lua so the match stays centered
		vim.keymap.set(
			"n",
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zzzv]],
			opts
		)
		vim.keymap.set(
			"n",
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zzzv]],
			opts
		)
		vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>zzzv]], opts)
		vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>zzzv]], opts)
		vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>zzzv]], opts)
		vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>zzzv]], opts)
	end,
}
