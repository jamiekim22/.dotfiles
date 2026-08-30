return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        picker = { 
            enabled = true,
            exclude = {
                ".git",
                "node_modules",
                "dist",
                "build",
            },
        },
    },
    keys = {
        -- picker
        { "<leader>pf", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>pF", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>ps", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>pr", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Find Recent Files (In cwd)" },
        { "<leader>pR", function() Snacks.picker.recent() end, desc = "Find Recent Files" },

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
