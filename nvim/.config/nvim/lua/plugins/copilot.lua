return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      auto_trigger = false,
      keymap = {
        next = "<M-n>",
        prev = "<M-p>",
      },
    },
    filetypes = {
      markdown = true,
      yaml = true,
      help = true,
    },
  },
}
