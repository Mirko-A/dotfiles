return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
          follow_file = false,
          jump = { close = false },
        },
      },
    },
  },
}
