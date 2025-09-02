return {
  "folke/snacks.nvim",
  keys = {
    {
      "<F3>",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
  },
}
