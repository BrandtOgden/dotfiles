return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "lua", "rust", "python", "cpp", "bash", "markdown" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = false, disable = { "python" } },
    modules = {},
    ignore_install = {},
  },
}
