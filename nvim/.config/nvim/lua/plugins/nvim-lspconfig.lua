local M = {}

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    local installed_servers = require("mason-lspconfig").get_installed_servers()
    for _, server in pairs(installed_servers) do
      require("lspconfig")[server].setup {}
    end
  end,
  keys = {
    { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
    { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
    { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
    { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
    { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
    { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
    { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
  }
}
