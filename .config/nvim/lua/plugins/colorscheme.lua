return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    })
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
