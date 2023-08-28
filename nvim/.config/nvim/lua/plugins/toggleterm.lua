local M = {}

return {
  "akinsho/toggleterm.nvim",
  init = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      on_open = function(_)
        vim.cmd("startinsert!")
      end,
      on_close = function(_)
        vim.cmd("startinsert!")
      end
    })
    function M.toggle_lazygit(dir)
      if not lazygit:is_open() then
        if dir ~= lazygit.dir then
          -- lazygit:spawn()
          -- lazygit:send('q')
          -- lazygit:change_dir(dir)
          lazygit:toggle()
        else
          lazygit:toggle()
        end
      else
        lazygit:toggle()
      end
    end
  end,
  keys = {
    { "<C-g>", function() M.toggle_lazygit(vim.fn.getcwd()) end, mode = "n", desc = "Toggle lazygit" },
    { "<C-g>", function() M.toggle_lazygit() end, mode = "t" }
  }
}
