-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- On save, let vtsls add missing imports and apply TS fix-alls (unused imports, etc.)
-- before LazyVim's format-on-save runs. Safe no-op when vtsls isn't attached or
-- there's nothing to fix: `code_action({ apply=true, only={...} })` applies only
-- when exactly one matching action exists.
local ts_filetypes = {
  'typescript',
  'typescriptreact',
  'typescript.tsx',
  'javascript',
  'javascriptreact',
  'javascript.jsx',
}

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('ts_autoimports', { clear = true }),
  pattern = { '*.ts', '*.tsx', '*.mts', '*.cts', '*.js', '*.jsx', '*.mjs', '*.cjs' },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if not vim.tbl_contains(ts_filetypes, ft) then
      return
    end
    -- Only act when vtsls (or ts_ls) is attached to this buffer.
    local has_ts_lsp = false
    for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
      if c.name == 'vtsls' or c.name == 'ts_ls' or c.name == 'tsserver' then
        has_ts_lsp = true
        break
      end
    end
    if not has_ts_lsp then
      return
    end
    -- Save exact cursor position; the source actions below can move it,
    -- and restoring via the `" mark jumps to a stale "last left buffer" pos.
    local win = vim.api.nvim_get_current_win()
    local cursor = vim.api.nvim_win_get_cursor(win)
    pcall(LazyVim.lsp.action['source.addMissingImports.ts'])
    pcall(LazyVim.lsp.action['source.fixAll.ts'])
    -- Restore the exact cursor we saved (only if the window still exists).
    if vim.api.nvim_win_is_valid(win) then
      pcall(vim.api.nvim_win_set_cursor, win, cursor)
    end
  end,
})
-- Subtle mode color cue: tint the cursorline + window separators by mode
-- so you can tell insert vs normal at a glance without a popup.
--   insert  -> cool blue tint (typing = "active")
--   normal  -> cool teal tint (default-ish)
--   visual/replace/command -> soft yellow tint
-- Re-applied after a colorscheme reload so it survives theme switches.

local function mode_tint(mode)
  if mode == "i" then
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2e2238", bold = true })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#b08cd6", bold = true })
  elseif mode == "n" then
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f2d3a" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#5f8fb0" })
  else
    -- v, V, ^V, R, c, etc.
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3a3320" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#c2a657" })
  end
end

local function apply_current_mode_tint()
  mode_tint(vim.fn.mode())
end

vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("mode_tint", { clear = true }),
  callback = function(args)
    -- args.match is "from:to", e.g. "n:i" or "i:n"
    local to_mode = args.match:match(":(.+)$")
    if to_mode then
      mode_tint(to_mode)
    end
  end,
})

-- Colorscheme reloads wipe our overrides; re-apply the current mode's tint.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("mode_tint_reapply", { clear = true }),
  callback = apply_current_mode_tint,
})

-- Apply once on startup so normal mode starts tinted.
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("mode_tint_init", { clear = true }),
  once = true,
  callback = apply_current_mode_tint,
})
