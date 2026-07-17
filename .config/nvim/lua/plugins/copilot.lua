-- GitHub Copilot autocomplete setup (standalone copilot.lua)
-- Uses copilot.lua's built-in ghost-text suggestions and panel,
-- independent of the completion engine (works with blink.cmp).
--
-- Prerequisites:
--   1. A GitHub Copilot subscription (individual or via org)
--   2. Run :Copilot auth once inside Neovim to sign in
--
-- After auth, suggestions appear as ghost text automatically.
-- Press <M-l> (Alt-l) to accept, or open the panel with <M-CR>.

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = true,
          keymap = {
            open = "<M-CR>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          ["*"] = true,
        },
      })
    end,
  },
}
