-- Extend blink.cmp's snippet source so custom TS snippets also load for
-- TSX/JS/JSX filetypes. Snippets live in ~/.config/nvim/snippets/*.json.
return {
  {
    "Saghen/blink.cmp",
    opts = {
      snippets = {
        extended_filetypes = {
          typescript = { "javascript" },
          typescriptreact = { "typescript", "javascript" },
          javascript = { "typescript" },
          javascriptreact = { "typescript", "javascript" },
        },
      },
    },
  },
}
