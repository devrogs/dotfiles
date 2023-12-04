return {
  "rcarriga/nvim-dap-ui",
  config = function(_, opts)
    require("dapui").setup(opts)
  end,
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  }
}
