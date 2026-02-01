return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      commentStyle = { italic = false },
      keywordStyle = { italic = false, bold = false },
      statementStyle = { bold = false },
      variablebuiltinStyle = { bold = false },
      overrides = function()
        return {
          Boolean = { bold = false },
        }
      end,
    })
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night",
--       styles = {
--         comments = { italic = false },
--         keywords = { italic = false },
--       },
--     })
--     vim.cmd.colorscheme("tokyonight-night")
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd.colorscheme("rose-pine")
--   end,
-- }
