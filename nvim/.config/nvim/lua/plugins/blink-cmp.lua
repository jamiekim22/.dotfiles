return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		opts = {
			fuzzy = {
				implementation = "prefer_rust",
			},
			keymap = {
				preset = "default",
				["<C-space>"] = false,
				["<C-e>"] = false,
				["<C-x>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-g>"] = { "cancel", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				documentation = {
					auto_show = true,
				},
				ghost_text = {
					enabled = false,
					show_with_menu = false,
				},
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
			},
			cmdline = {
				enabled = true,
				keymap = {
					preset = "cmdline",
					["<C-space>"] = false,
					["<C-e>"] = false,
					["<C-x>"] = { "show", "fallback" },
					["<C-g>"] = { "cancel", "fallback" },
				},
				completion = {
					menu = {
						auto_show = true,
						-- tiny-cmdline sits near the bottom, so open the menu above it
						direction_priority = { "n", "s" },
						cmdline_position = function()
							local ok, ui2 = pcall(require, "vim._core.ui2")
							local win = ok and ui2.wins and ui2.wins.cmd
							if win and vim.api.nvim_win_is_valid(win) then
								local cfg = vim.api.nvim_win_get_config(win)
								local row = type(cfg.row) == "number" and cfg.row or 0
								local col = type(cfg.col) == "number" and cfg.col or 0
								return { row, col + 1 }
							end
							if vim.g.ui_cmdline_pos ~= nil then
								return { vim.g.ui_cmdline_pos[1] - 1, vim.g.ui_cmdline_pos[2] + 1 }
							end
							local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
							return { vim.o.lines - height, 1 }
						end,
					},
				},
			},
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
				providers = {
					lsp = {
						opts = {
							tailwind_color_icon = "󱓻",
						},
					},
				},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			snippets = {
				preset = "luasnip",
			},
		},
		config = function(_, opts)
			require("blink.cmp").setup(opts)
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
