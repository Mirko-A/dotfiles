return {
  "milanglacier/minuet-ai.nvim",
  opts = {
    -- ////////// Virtual text settings.
    virtualtext = {
      auto_trigger_ft = {},
      keymap = {
        -- accept whole completion
        accept = "<A-A>",
        -- accept one line
        accept_line = "<A-a>",
        -- accept n lines (prompts for number)
        accept_n_lines = "<A-z>",
        -- Cycle to next completion item, or manually invoke completion
        next = "<A-n>",
        -- Cycle to prev completion item, or manually invoke completion
        prev = "<A-p>",
        dismiss = "<A-e>",
      },
    },
    -- ////////// Local llama.cpp provider settings.
    provider = "openai_fim_compatible",
    -- Recommended for local model for resource saving.
    n_completions = 1,
    context_window = 512,
    provider_options = {
      openai_fim_compatible = {
        api_key = "TERM",
        name = "Llama.cpp",
        end_point = "http://localhost:11434/v1/completions",
        -- The model is set by the llama-cpp server and cannot be altered
        -- post-launch.
        model = "PLACEHOLDER",
        optional = {
          max_tokens = 56,
          top_p = 0.9,
        },
        -- llama.cpp does not support the `suffix` option in FIM completion.
        -- Therefore, we must disable it and manually populate the special
        -- tokens required for FIM completion.
        template = {
          prompt = function(context_before_cursor, context_after_cursor, _)
            return "<|fim_prefix|>"
              .. context_before_cursor
              .. "<|fim_suffix|>"
              .. context_after_cursor
              .. "<|fim_middle|>"
          end,
          suffix = false,
        },
      },
    },
  },
}
