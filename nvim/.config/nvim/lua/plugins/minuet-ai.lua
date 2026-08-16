return {
  "milanglacier/minuet-ai.nvim",
  opts = {
    -- Virtual text configuration.
    virtualtext = {
      auto_trigger_ft = {},
      keymap = {
        -- Accept whole completion.
        accept = "<A-A>",
        -- Accept one completion line.
        accept_line = "<A-a>",
        -- Accept n completion lines (prompts for number).
        accept_n_lines = "<A-z>",
        -- Cycle to next completion item, or manually invoke completion.
        next = "<A-n>",
        -- Cycle to prev completion item, or manually invoke completion.
        prev = "<A-p>",
        dismiss = "<A-e>",
      },
    },

    provider = "gemini",

    n_completions = 2,
    context_window = 16000,

    -- Recommended for local model for resource saving.
    -- n_completions = 1,
    -- context_window = 1024,

    provider_options = {
      -- Google Gemini configuration.
      gemini = {
        model = "gemini-2.0-flash",
        stream = true,
        api_key = "GEMINI_API_KEY",
        end_point = "https://generativelanguage.googleapis.com/v1beta/models",
        optional = {},
        -- A list of functions to transform the endpoint, header, and request body.
        transform = {},
      },

      -- Local model configuration.
      openai_fim_compatible = {
        api_key = "TERM",
        name = "llama.cpp",
        end_point = "http://localhost:11434/v1/completions",
        optional = {
          max_tokens = 128,
        },
        model = "unsloth/Qwen3-Coder-Next",
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
