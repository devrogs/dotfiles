return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      opts = {},
      keys = {
        { "<leader>a", function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner") end, desc = "Swap next parameter" },
        { "<leader>A", function() require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner") end, desc = "Swap previous parameter" },
      },
    },
  },
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
    local languages = {
      "bash", "dockerfile", "gitignore", "html", "java", "json", "lua",
      "markdown", "markdown_inline", "python", "scala", "yaml",
    }
    -- Install missing parsers asynchronously; TSUpdate handles upgrades.
    if vim.fn.executable("tree-sitter") == 1 then
      ts.install(languages)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterConfig", { clear = true }),
      callback = function(event)
        local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if not lang then
          return
        end
        local ok, loaded = pcall(vim.treesitter.language.add, lang)
        if not ok or not loaded then
          return
        end
        vim.treesitter.start(event.buf, lang)
        if vim.treesitter.query.get(lang, "indents") then
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        -- Remap to Neovim 0.12's built-in node text objects.
        vim.keymap.set("n", "<CR>", "van", {
          buffer = event.buf, remap = true, desc = "Start syntax selection",
        })
        vim.keymap.set("x", "<CR>", "an", {
          buffer = event.buf, remap = true, desc = "Expand syntax selection",
        })
        vim.keymap.set("x", "<Tab>", "an", {
          buffer = event.buf, remap = true, desc = "Expand syntax selection",
        })
        vim.keymap.set("x", "<BS>", "in", {
          buffer = event.buf, remap = true, desc = "Shrink syntax selection",
        })
      end,
    })
  end,
}
