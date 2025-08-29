return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    local rustAnalyzerSettings = opts.server.default_settings["rust-analyzer"]
    rustAnalyzerSettings.cargo.allFeatures = false
    rustAnalyzerSettings.cargo.features = {}
    rustAnalyzerSettings.inlayHints = {
      typeHints = false,
      parameterHints = false,
    }
    rustAnalyzerSettings.rustfmt = {
      extraArgs = { "+nightly" },
    }
  end,
}
