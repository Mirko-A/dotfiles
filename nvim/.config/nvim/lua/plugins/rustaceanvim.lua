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
    -- LazyVim's default exclude list contains "bin", which hides real
    -- workspace crates living in a bin/ directory from rust-analyzer.
    globalRustAnalyzerSettings.files.exclude = vim.tbl_filter(function(dir)
      return dir ~= "bin"
    end, globalRustAnalyzerSettings.files.exclude)
  end,
}
