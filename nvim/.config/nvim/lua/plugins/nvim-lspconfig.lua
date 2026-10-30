local M = {}

function M.diagnostic_goto(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = next and 1 or -1, severity = severity, float = true })
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  lazy = false,
  config = function()
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
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
