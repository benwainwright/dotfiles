local servers = require("lsp.servers")
local react_filter = require("lsp.react-filter")
local eslint = require("diagnosticls-configs.linters.eslint")
local fs = require("lsp.fs")
local Delay = require("Delay")

servers.configure {
  {
    name = "sumneko_lua",
    options = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  },
  -- {
  --   name = "diagnosticls",
  --   options = {
  --     filetypes = {
  --       "typescript", "typescriptreact", "javascript", "javascriptreact"
  --     },
  --     typescript = {
  --       linter = eslint
  --     },
  --     typescriptreact = {
  --       linter = eslint
  --     },
  --     javascript = {
  --       linter = eslint
  --     },
  --     javascriptreact = {
  --       linter = eslint
  --     }
  --   }
  -- },
  {
    name = "tsserver",
    options = {
      handlers = {
        ['textDocument/definition'] = react_filter
      },
      debounce_text_changes = 150,
      on_attach = function(client)
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup {
          eslint_enable_diagnostics = false,
          disable_commands = false,
          -- eslint_enable_disable_comments = true,
          enable_formatting = false,
          update_imports_on_move = true,
          require_confirmation_on_move = false,
          watch_dir = nil
        }

        client.resolved_capabilities.document_formatting = false
        ts_utils.setup_client(client)
      end
    }
  },
  -- {
  --   name = "efm",
  --   options = {
  --     init_options = {
  --       documentFormatting = false,
  --       codeAction = true
  --     },
  --     filetypes = { 'lua', 'typescript' },
  --     settings = {
  --       rootMarkers = {
  --         ".git/"
  --       },
  --       languages = {
  --         typescript = {
  --           {
  --             lintCommand = 'yarn eslint --format visualstudio --stdin --stdin-filename ${INPUT}',
  --             lintIgnoreExitCode = true,
  --             lintStdin = true,
  --             lintFormats = {
  --               "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"
  --             }
  --           }
  --         },
  --         lua = {
  --           {
  --             formatCommand = "lua-format -i --config=lua-format.config",
  --             formatStdin = true
  --           }
  --         }
  --       }
  --     }
  --   }
  -- },
  "bashls",
  "jedi_language_server",
  "vimls",
  "ccls",
  "dockerls",
  "gopls",
  "eslint",
  "html",
  "angularls",
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  {
    name = "jsonls",
    options = {
      init_options = {
        provideFormatter = false
      },
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      }
    }
  },
  "jdtls",
  "rust_analyzer",
  "sqls",
  "tailwindcss",
  "yamlls"
}
