return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = false,
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "nvim-Tree Toggle" })
    vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", { desc = "nvim-Tree Focus current file" })
    vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "Nvim-Tree Collapse" })
  end,
}
