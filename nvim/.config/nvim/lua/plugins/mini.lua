return {
    { 'nvim-mini/mini.nvim', version = '*' },

    -- mini.files
    { 
        'nvim-mini/mini.files', version = '*',
        opts = {
            windows = {
              preview = true, 
              width_focus = 60,
            },
            options = {
                permanent_delete = false, -- Example tweak: Move to trash instead of permanent delete
            },
        },
        keys = {
            { "<leader>ee", function() require("mini.files").open() end, desc = "Toggle mini file explorer", },
            { "<leader>ef",
                function()
                    local MiniFiles = require("mini.files")
                    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                    MiniFiles.reveal_cwd()
                end,
                desc = "Toggle into currently opened file",
            },
        },

    },
}
