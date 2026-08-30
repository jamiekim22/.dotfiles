return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        global_settings = {
            save_on_toggle = true,
            save_on_change = true,
        },
    },
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add file" },
        {
            "<C-e>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Harpoon quick menu",
        },
        { "<M-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
        { "<M-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
        { "<M-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
        { "<M-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
        { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
        { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
    },
}
