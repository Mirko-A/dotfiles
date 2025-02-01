local filetypes = {
  "bib",
  "gitcommit",
  "markdown",
  "org",
  "plaintex",
  "rst",
  "rnoweb",
  "tex",
  "pandoc",
  "rust",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "lua",
  "python",
  "html",
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          filetypes = filetypes,
          settings = {
            ltex = {
              enabled = filetypes,
              language = "en-US",
              additionalRules = {
                checkFrequency = "save",
                enablePickyRules = true,
                motherTongue = "en-US",
              },
            },
          },
        },
      },
    },
  },
}
