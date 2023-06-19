return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map("n", "<leader>gim", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>gid", gs.diffthis, "Diff This")
    end
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
