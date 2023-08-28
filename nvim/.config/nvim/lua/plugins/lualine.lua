return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = { left = "/", right = "/" },
      section_separators = { left = "", right = "" }
    },
    sections = {
      lualine_a = {
        {
          "mode", fmt = function(mode) return " " .. mode end
        }
      },
      lualine_b = {
        {
          "diagnostics",
          icons_enabled = false -- disabled because of font incompatibility between WezTerm and lualine
        },
        {
          "branch"
        },
        {
          "diff"
        }
      },
      lualine_c = {
        {
          "filename",
          path = 1
        }
      }
    }
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end
}
