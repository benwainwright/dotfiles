return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = "VeryLazy",

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'none',

        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Enter>'] = { 'accept', 'fallback' },
        ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        ghost_text = { enabled = true },
        documentation = {
          auto_show = true,
        },
        menu = {
          draw = {
            columns = { { "kind_icon", gap = 1 }, { "label", "label_description", gap = 1, width = { fill = true } }, { "kind" }, { "source_name" } },
          }
        }
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = {
      "saghen/blink.cmp", "zbirenbaum/copilot.lua", "giuxtaposition/blink-cmp-copilot"
    }
  }
}
