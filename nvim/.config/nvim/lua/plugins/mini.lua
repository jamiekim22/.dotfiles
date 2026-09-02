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
        event = { "BufReadPre", "BufNewFile" },
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

    -- Trailspace
    {
        "nvim-mini/mini.trailspace",
        version = '*',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")

            miniTrailspace.setup({
                only_in_normal_buffers = true,
            })
            vim.keymap.set("n", "<leader>tw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })

            -- Ensure highlight never reappears by removing it on CursorMoved
            vim.api.nvim_create_autocmd("CursorMoved", {
                pattern = "*",
                callback = function()
                    require("mini.trailspace").unhighlight()
                end,
            })
        end,
    },

    -- Split & join
    {
        "nvim-mini/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")
            miniSplitJoin.setup({
                mappings = { toggle = "" }, -- Disable default mapping
            })
            vim.keymap.set({ "n", "x" }, "bj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
            vim.keymap.set({ "n", "x" }, "bk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
        end,
    },

}
