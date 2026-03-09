return {
  "nvim-mini/mini.sessions",
  version = false,
  event = "VimEnter",
  config = function()
    require("mini.sessions").setup()
  end
}
