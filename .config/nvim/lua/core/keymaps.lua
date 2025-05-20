vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- window splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window Vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window Horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make Splits Equal" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>sf", "<C-w>o", { desc = "make the current Split Fullscreen" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text down" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over current selection without loosing clipboard" })

-- Keep selected text after changing indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlights" })
