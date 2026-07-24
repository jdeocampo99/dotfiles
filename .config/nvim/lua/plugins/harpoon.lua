-- ThePrimeagen/harpoon (v2): pin a handful of files per task and jump
-- straight to them, instead of fuzzy-finding through the whole project.
--
--   <leader>ha   add current file to the list
--   <leader>he   toggle the quick-menu (reorder/remove marks)
--   <C-1>..<C-4> jump directly to slot 1-4

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = function()
    local harpoon = require("harpoon")

    local function list()
      return harpoon:list()
    end

    return {
      { "<leader>ha", function() list():add() end, desc = "Harpoon add file" },
      { "<leader>he", function() harpoon.ui:toggle_quick_menu(list()) end, desc = "Harpoon quick menu" },
      { "<C-1>", function() list():select(1) end, desc = "Harpoon to file 1" },
      { "<C-2>", function() list():select(2) end, desc = "Harpoon to file 2" },
      { "<C-3>", function() list():select(3) end, desc = "Harpoon to file 3" },
      { "<C-4>", function() list():select(4) end, desc = "Harpoon to file 4" },
    }
  end,
}
