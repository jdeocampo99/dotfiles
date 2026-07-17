-- Make the Snacks explorer always open at the git repo root, not the
-- LSP/cwd root. In the web-next monorepo, LazyVim.root() resolves to the
-- nearest nested project (tsconfig/package.json), so <leader>e showed only
-- that subtree. This overrides the keymaps from
-- lazyvim.plugins.extras.editor.snacks_explorer to use the git root.
local function git_root()
  local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if root == "" or vim.v.shell_error ~= 0 then
    return LazyVim.root()
  end
  return root
end

return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>fe",
      function()
        Snacks.explorer({ cwd = git_root() })
      end,
      desc = "Explorer Snacks (git root)",
    },
    {
      "<leader>fE",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (LazyVim root)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Snacks (git root)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Snacks (LazyVim root)", remap = true },
  },
}
