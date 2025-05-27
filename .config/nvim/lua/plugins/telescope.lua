return {
  "nvim-telescope/telescope.nvim",
  event = { "VimEnter" },
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files in cwd" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git files in cwd" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open Buffer" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current selection (Word)" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help tags" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent files" })
    vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Find Man page entries" })
    vim.keymap.set("n", "<leader>fo", builtin.commands, { desc = "Find plugin/user cOmmands" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo comments" })

    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Find neovim Config files" })
  end,
}
