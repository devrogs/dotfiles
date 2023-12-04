return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  config = function(_, opts)
    require("mason").setup(opts)
  end,
  keys = {
    { "<leader>ma", vim.cmd.Mason, mode = "n", desc = "Open Mason" }
  }
}
