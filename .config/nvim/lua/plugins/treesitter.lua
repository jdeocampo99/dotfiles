-- Disable treesitter's indent module so Enter in insert mode preserves
-- indentation via autoindent/smartindent instead of being overridden by
-- treesitter's indentexpr (which can mis-dedent to column 0 on some files).
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {},
    highlight = { enable = true },
    indent = { enable = false },
  },
}
