return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_b = { "branch", "diagnostics" },
      lualine_x = { "filetype" },
      lualine_y = {},
    },
    options = {
      ignore_focus = { "NvimTree" },
      globalstatus = true,
    },
  },
}
