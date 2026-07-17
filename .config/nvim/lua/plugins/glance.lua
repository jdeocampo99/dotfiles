-- Peek definitions / references / type definitions / implementations
-- in a floating window (VS Code-like peek).
-- LazyVim binds gd/gr/gy/gI to *jump*. To avoid the conflict, peek
-- lives under a "gp" (peek) prefix:
--   gpd -> peek definitions
--   gpy -> peek type definitions
--   gpr -> peek references
--   gpI -> peek implementations
-- Inside the peek window: Enter jumps, q/Esc closes, <C-d>/<C-u> scroll.
return {
  "DNLHC/glance.nvim",
  event = "LspAttach",
  config = function()
    local actions = require("glance").actions
    require("glance").setup({
      border = { enable = true },
      list = { position = "right", width = 0.4 },
      theme = { enable = true, mode = "auto" },
      mappings = {
        list = {
          ["<C-u>"] = actions.preview_scroll_win(5),
          ["<C-d>"] = actions.preview_scroll_win(-5),
          ["<CR>"] = actions.jump,
          ["q"] = actions.close,
          ["<Esc>"] = actions.close,
        },
        preview = {
          ["q"] = actions.close,
          ["Q"] = actions.close,
          ["<Esc>"] = actions.close,
          ["<leader>l"] = actions.enter_win("list"),
        },
      },
    })
  end,
  keys = {
    { "gpd", "<CMD>Glance definitions<CR>", desc = "Peek definitions" },
    { "gpy", "<CMD>Glance type_definitions<CR>", desc = "Peek type definitions" },
    { "gpr", "<CMD>Glance references<CR>", desc = "Peek references" },
    { "gpI", "<CMD>Glance implementations<CR>", desc = "Peek implementations" },
  },
}
