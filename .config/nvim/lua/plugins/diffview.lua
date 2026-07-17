local function merge_target()
  for _, ref in ipairs({ "master", "main", "origin/master", "origin/main" }) do
    vim.fn.system({ "git", "rev-parse", "--verify", "--quiet", ref })
    if vim.v.shell_error == 0 then
      return ref
    end
  end
  return "HEAD"
end

return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      {
        "<leader>gd",
        function()
          vim.cmd("DiffviewOpen " .. merge_target() .. "...HEAD")
        end,
        desc = "Diff View Open (vs merge target)",
      },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diff View Close" },
      { "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "Diff View File History" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diff View Current File History" },
    },
    opts = {},
  },
}
