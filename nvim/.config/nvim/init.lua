require("config")

-- Opt-in to the experimental Neovim 0.12 UI2 layer
require('vim._core.ui2').enable({})

-- Editor theme
local theme_file = vim.fn.stdpath("state") .. "/colorscheme"

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(args)
        vim.fn.writefile({ args.match }, theme_file)
    end,
})

local ok, lines = pcall(vim.fn.readfile, theme_file)
local name = (ok and lines[1] and lines[1] ~= "") and lines[1] or "tokyonight-day"
pcall(vim.cmd.colorscheme, name)
