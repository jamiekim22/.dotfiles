return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		user_commands = true,
		filetypes = {
			"*",
			"!lazy",
			toml = {
				parsers = {
					hex = { default = true, rrggbb = true, rgb = true, rgba = true, rrggbbaa = true },
					names = { enable = false },
				},
			},
			javascript = {
				parsers = { tailwind = { enable = true, lsp = true, update_names = true } },
			},
			typescript = {
				parsers = { tailwind = { enable = true, lsp = true, update_names = true } },
			},
			javascriptreact = {
				parsers = { tailwind = { enable = true, lsp = true, update_names = true } },
			},
			typescriptreact = {
				parsers = { tailwind = { enable = true, lsp = true, update_names = true } },
			},
		},
		options = {
			parsers = {
				css = true,
				hex = {
					default = true,
					rgb = true,
					rgba = true,
					rrggbb = true,
					rrggbbaa = true,
				},
				tailwind = { enable = false },
			},
		},
	},
}
