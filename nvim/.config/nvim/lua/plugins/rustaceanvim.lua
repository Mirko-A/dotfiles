return {
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    opts = {
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = false,
              -- add features that rust-analyzer should consider enabled
              features = {},
            },
            -- Disable inlay hints
            inlayHints = {
              typeHints = false,
              parameterHints = false,
            },
            procMacro = {
              enable = true,
              ignored = {
                -- Removed `async_trait` for now, can be brought back if needed.
                -- ["async-trait"] = { "async-trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
            rustfmt = {
              extraArgs = { "+nightly" },
            },
          },
        },
      },
    },
  },
}
