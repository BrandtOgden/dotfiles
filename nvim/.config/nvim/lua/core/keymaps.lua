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

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over current selection without loosing clipboard" })
vim.keymap.set("x", "<leader>d", '"_d', { desc = "Delete current selection without loosing clipboard" })

vim.keymap.set(
  "n",
  "[<Space>",
  ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>',
  { desc = "Insert blankline above", silent = true }
)
vim.keymap.set(
  "n",
  "]<Space>",
  ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>',
  { desc = "Insert blankline below", silent = true }
)

-- Random
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlights", silent = true })
vim.keymap.set("n", "<leader>rr", ":%s/\\r//g<CR>", { desc = "Remove \r from Windows paste", silent = true })
