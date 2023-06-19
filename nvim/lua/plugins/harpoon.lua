return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle harpoon menu"},
    { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Toggle harpoon menu"},
    { "<C-h>", function() require("harpoon.ui").nav_file(1) end, desc = "Navigate to file 1" },
    { "<C-j>", function() require("harpoon.ui").nav_file(2) end, desc = "Navigate to file 2" },
    { "<C-k>", function() require("harpoon.ui").nav_file(3) end, desc = "Navigate to file 3" },
    { "<C-l>", function() require("harpoon.ui").nav_file(4) end, desc = "Navigate to file 4" }
  },
  config = function(_, opts)
    require("harpoon").setup(opts)
  end
}
