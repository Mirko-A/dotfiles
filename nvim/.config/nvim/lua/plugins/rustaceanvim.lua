return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    local globalRustAnalyzerSettings = opts.server.default_settings["rust-analyzer"]
    globalRustAnalyzerSettings.cargo.allFeatures = false
    globalRustAnalyzerSettings.cargo.features = {}
    globalRustAnalyzerSettings.inlayHints = {
      typeHints = false,
      parameterHints = false,
    }
    globalRustAnalyzerSettings.rustfmt = {
      extraArgs = { "+nightly" },
    }
  end,
}
