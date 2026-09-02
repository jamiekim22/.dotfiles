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
        { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
        { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
        { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
        { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
        { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon file 5" },
        { "<leader>6", function() require("harpoon"):list():select(6) end, desc = "Harpoon file 6" },
        { "<leader>7", function() require("harpoon"):list():select(7) end, desc = "Harpoon file 7" },
        { "<leader>8", function() require("harpoon"):list():select(8) end, desc = "Harpoon file 8" },
        { "<leader>9", function() require("harpoon"):list():select(9) end, desc = "Harpoon file 9" },
        -- { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
        -- { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
    },
}
