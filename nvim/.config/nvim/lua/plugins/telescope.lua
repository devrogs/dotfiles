local config_dir = vim.fn.stdpath("config")
local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
        },
      },
    }
  },
  keys = {
    { "<leader>.", "<cmd>Telescope find_files cwd=" .. config_dir .. "<cr>", desc = "Switch Buffer" },
    { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Switch Buffer" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
    { "<leader>fc", "<cmd>Telescope find_files cwd=%:h:p<cr>", desc = "Find Files (current file)" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status files" }
  }
}
