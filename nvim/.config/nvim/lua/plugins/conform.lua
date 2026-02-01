return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  keys = {
    {
      -- Mostly to format disabled filetypes like C/C++
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Lsp Format",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt", lsp_format = "fallback" },
      json = { "jq" },
    },
    format_on_save = function(bufnr)
      -- Disable formatting on save for C/C++
      local disabled = { c = true, cpp = true, svelte = true, python = true }
      if disabled[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
  },
}
