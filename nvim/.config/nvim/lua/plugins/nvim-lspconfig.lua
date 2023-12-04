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
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local installed_servers = require("mason-lspconfig").get_installed_servers()
    for _, server in pairs(installed_servers) do
      require("lspconfig")[server].setup {}
    end
  end,
  keys = {
    { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
    { "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
    { "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
    { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
    { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
    { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
    { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
    { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
    { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>si", vim.lsp.buf.signature_help, desc = "Signature Help" },
    { "<C-s>", vim.lsp.buf.signature_help, desc = "Signature Help", mode = "i" },
    { "<leader>re", vim.lsp.buf.rename, desc = "Rename" }
  }
}
