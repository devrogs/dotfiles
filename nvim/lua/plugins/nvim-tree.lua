local PATH_CWD = 1
local PATH_RELATIVE = 2
local PATH_PREVIOUS = 3

local function open(path_type)
  local tree = require("nvim-tree.api").tree
  if tree.is_visible() then
    tree.close()
  end

  if path_type == PATH_CWD then
    tree.open({path=vim.fn.getcwd()})
  elseif path_type == PATH_RELATIVE then
    tree.open({find_file = true, path = vim.fn.expand("%:p:h")})
  else
    tree.open()
  end

  tree.focus()
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup()
  end,
  keys = {
    { "<leader>tE", function() open(PATH_CWD) end, mode = "n", desc = "Open the file explorer in the current working directory" },
    { "<leader>te", function() open(PATH_RELATIVE) end, mode = "n", desc = "Open the file explorer relative to the current buffer" },
    { "<leader>tt", function() open(PATH_PREVIOUS) end, mode = "n", desc = "Open the file explorer" },
    { "<leader>tq", vim.cmd.NvimTreeClose, mode = "n", desc = "Close the file explorer" }
  }
}
