require("core.options")
require("core.keymaps")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.indentexpr = ""
  end,
})
