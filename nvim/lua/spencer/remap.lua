

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--move line remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>zf", function()
    require("zk.commands").get("ZkNew")({ dir = "fleeting" })
end, opts)

vim.keymap.set("n", "<leader>zc", function()
    require("zk.commands").get("ZkNew")({ dir = "concrete" })
end, opts)

vim.keymap.set("n", "<leader>za", function()
    require("zk.commands").get("ZkNew")({ dir = "abstract" })
end, opts)
