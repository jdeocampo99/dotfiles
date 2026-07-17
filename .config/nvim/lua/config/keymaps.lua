-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Save file when exiting insert mode with Ctrl-C
vim.keymap.set("i", "<C-c>", "<Esc>:w<CR>", { desc = "Exit insert mode and save" })
-- Save file when exiting insert mode with Escape
vim.keymap.set("i", "<Esc>", "<Esc>:w<CR>", { desc = "Exit insert mode and save" })
-- Repo-wide live grep (searches from git root, not current subdir)
vim.keymap.set("n", "<leader>/", function()
  local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if root == "" or vim.v.shell_error ~= 0 then
    require("telescope.builtin").live_grep()
    return
  end
  require("telescope.builtin").live_grep({ cwd = root })
end, { desc = "Grep (repo root)" })
-- Copy current file path to the system clipboard
vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("No file in buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", path)
  vim.fn.setreg('"', path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy file path" })

-- Paste clipboard content at cursor
vim.keymap.set("n", "<leader>vp", function()
  local text = vim.fn.getreg("+")
  if text == "" then
    vim.notify("Clipboard is empty", vim.log.levels.WARN)
    return
  end
  vim.api.nvim_put(vim.split(text, "\n"), "c", true, true)
  vim.notify("Pasted from clipboard")
end, { desc = "Paste from clipboard" })

-- Open Diffview showing all diffs on this branch vs master
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen master...HEAD<CR>", { desc = "Diffview branch vs master" })
-- Close Diffview
vim.keymap.set("n", "<leader>gC", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
