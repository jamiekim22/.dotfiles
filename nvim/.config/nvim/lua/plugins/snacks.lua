return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        terminal = {},
        picker = {
            enabled = true,
            exclude = {
                ".git",
                "node_modules",
                "dist",
                "build",
            },
            sources = {
                colorschemes = {
                    -- Hide Neovim built-ins and mini.nvim palettes; keep theme.lua plugins.
                    transform = function(item)
                        local file = item.file or ""
                        local runtime = vim.env.VIMRUNTIME
                        if runtime and file:find(runtime, 1, true) == 1 then
                            return false
                        end
                        if file:find("mini.nvim", 1, true) then
                            return false
                        end
                    end,
                },
            },
        },
    },
    keys = {
        -- picker
        -- { "<leader>pf", function() Snacks.picker.files() end, desc = "Find Files" },
        -- { "<leader>pF", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        -- { "<leader>ps", function() Snacks.picker.grep() end, desc = "Grep" },
        -- { "<leader>pr", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Find Recent Files (In cwd)" },
        -- { "<leader>pR", function() Snacks.picker.recent() end, desc = "Find Recent Files" },
        -- { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search Visual selection or Word", mode = { "n", "x" } },

        -- lazygit
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit logs" },

        -- misc utils
        { "<leader>vh", function() Snacks.picker.help() end, desc = "View Help Pages (Snacks Picker)" },
        { "<leader>vk", function() Snacks.picker.keymaps({ layout = "ivy" }) end, desc = "View Keymaps (Snacks Picker)" },
        { "<leader>th", function() Snacks.picker.colorschemes({ layout = "ivy" }) end, desc = "Pick Color Schemes"},
        { "<leader>rN", function() Snacks.rename.rename_file() end, desc = "Fast Rename Current File" },
    }
}
