return {
  "sainnhe/everforest",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[let g:everforest_background = 'soft']])
    vim.cmd([[let g:everforest_better_performance = 1]])
    vim.cmd([[colorscheme everforest]])
  end,
}
