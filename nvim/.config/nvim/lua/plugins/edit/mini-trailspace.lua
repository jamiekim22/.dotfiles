return {
	"nvim-mini/mini.trailspace",
	version = "*",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local miniTrailspace = require("mini.trailspace")

		miniTrailspace.setup({
			only_in_normal_buffers = true,
		})
		vim.keymap.set("n", "<leader>tw", function()
			miniTrailspace.trim()
		end, { desc = "Erase Whitespace" })

		-- Ensure highlight never reappears by removing it on CursorMoved
		vim.api.nvim_create_autocmd("CursorMoved", {
			pattern = "*",
			callback = function()
				require("mini.trailspace").unhighlight()
			end,
		})
	end,
}
