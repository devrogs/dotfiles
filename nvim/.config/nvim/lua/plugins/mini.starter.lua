return {
  "echasnovski/mini.starter",
  version = false,
  event = "VimEnter",
  config = function()
    require("mini.starter").setup {
      evaluate_single = true,
      header = "",
      footer = ""
    }
  end
}
