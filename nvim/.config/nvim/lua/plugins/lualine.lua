local function background_status()
  if vim.g["metals_status"] then
    return vim.g["metals_status"]
  else
    return ""
  end
end

local function virtual_env()
  local venv = os.getenv("VIRTUAL_ENV")

  if venv then
    local marker = vim.fs.find(
      { "pyproject.toml", "requirements.txt", "setup.py", ".git" },
      { upward = true, stop = vim.fn.expand("~") }
    )[1] -- attempt to find the project root by using popular markers

    if marker then
      local root = vim.fn.fnamemodify(marker, ":h")
      print(root)
      if venv == root .. "/.venv" then
        return vim.fn.fnamemodify(root, ":t")
      end
    else
      return os.getenv("VIRTUAL_ENV_PROMPT")
    end
  else
    return ""
  end
end

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
      },
      lualine_x = {
        background_status,
        "encoding",
        "fileformat",
        {
          "filetype",
          fmt = function(filetype)
            if filetype == "python" then
              local suffix = ""
              local venv = virtual_env()
              if venv and venv ~= "" then
                suffix = " " .. "(" .. venv .. ")"
              end
              return filetype .. suffix
            else
              return filetype
            end
          end
        }
      }
    }
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end
}
