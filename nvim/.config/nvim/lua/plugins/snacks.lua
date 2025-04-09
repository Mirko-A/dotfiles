return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    lazygit = {
      configure = false,
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
          jump = { close = false },
        },
      },
    },
  },
}
