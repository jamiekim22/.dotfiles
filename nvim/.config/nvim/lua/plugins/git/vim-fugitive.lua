return {
	"tpope/vim-fugitive",
	config = function()
		-- Add alias to convert :git to :Git in command line
		vim.cmd([[
				cnoreabbrev <expr> git (getcmdtype() == ':' && getcmdline() ==# 'git') ? 'Git' : 'git'
			]])

		vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>", { desc = "Fugitive fullscreen tab" })

		local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = myFugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				-- local bufnr = vim.api.nvim_get_current_buf()
				-- local opts = { buffer = bufnr, remap = false }

				-- -- NOTE: rebase always
				-- vim.keymap.set("n", "<leader>p", function()
				-- 	vim.cmd.Git({ "pull", "--rebase" })
				-- end, opts)
			end,
		})
	end,
}
