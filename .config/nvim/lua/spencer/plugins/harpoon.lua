{
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
                local harpoon = require("harpoon")
                harpoon:setup()
        end,
        keys = {
        { "<leader>a", function() 
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu", },
        { "<leader>a", function()
            require("harpoon"):list():append()
        end
        , desc = "harpoon add file", },
        { "<C-j>", function()
            local harpoon = require("harpoon")
            harpoon.ui:nav_next(harpoon:list())
        end,
        desc = "harpoon next", },
        { "<C-k>", function()
            local harpoon = require("harpoon")
            harpoon.ui:nav_prev(harpoon:list())
        end,
        desc = "harpoon next", },

        }
}
