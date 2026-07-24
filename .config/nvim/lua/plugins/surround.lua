-- kylechui/nvim-surround: add/change/delete surrounding pairs
-- (quotes, brackets, parens, tags) with simple keystrokes.
--
-- LazyVim does not ship surround by default (it has mini.ai + mini.pairs only),
-- so we add nvim-surround here. Default keymaps:
--   ys{motion}{pair}  add surround
--   cs{old}{new}      change surround
--   ds{pair}          delete surround
--
-- Visual mode: nvim-surround defaults to `S{pair}`, but that collides with
-- Flash.nvim's visual `S` (Flash Treesitter), which loads later and wins.
-- We disable nvim-surround's default visual mappings and rebind to `gs`
-- (LazyVim's reserved surround prefix / which-key group), so both plugins
-- coexist: `S` stays Flash, `gs` wraps the visual selection.
vim.g.nvim_surround_no_visual_mappings = true

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "gs", "<Plug>(nvim-surround-visual)", mode = "x", desc = "Surround selection" },
    { "gS", "<Plug>(nvim-surround-visual-line)", mode = "x", desc = "Surround selection (new lines)" },
  },
}
