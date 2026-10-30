return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
  opts = {
    -- Scala is managed by nvim-metals, including its DAP integration.
    automatic_enable = { exclude = { "metals" } },
  },
}
