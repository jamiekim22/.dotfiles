return {
    { 'nvim-mini/mini.nvim', version = '*' },

    -- Mini File Explorer (works with oil)
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
    
    -- Surround
    {
        "nvim-mini/mini.surround",
        version = '*',
        event = { "BufReadPre", hBufNewFileh },
        opts = {
            custom_surroundings = nil,
            -- INFO:
            -- saiw surround with no whitespace
            -- saw surround with whitespace
            mappings = {
                add = 'sa',            -- Add surrounding in Normal and Visual modes
                delete = 'ds',         -- Delete surroundng
                find = 'sf',           -- Find surrounding (to the right)
                find_left = 'sF',      -- Find surrounding (to the left)
                highlight = 'sh',      -- Highlight surrounding
                replace = 'sr',        -- Replace surrounding
                update_n_lines = 'sn', -- Update `n_lines`

                suffix_last = 'l',     -- Suffix to search with "prev" method
                suffix_next = 'n',     -- Suffix to search with "next" method
            },
        },
    },
}
