
return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                        ensure_installed = { "c_sharp", "c", "lua", "vim", "vimdoc", "query", "elixir",  "javascript", "html", "css" },
                        sync_install = false,
                        highlight = { enable = true },
                        indent = { enable = true },  
                        additional_vim_regex_highlighting = false,
                })
        end,
}

