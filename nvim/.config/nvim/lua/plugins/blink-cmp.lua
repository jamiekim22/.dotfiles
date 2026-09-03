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
					menu = { auto_show = true },
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
