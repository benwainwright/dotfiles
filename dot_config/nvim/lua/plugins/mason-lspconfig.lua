return {
	event = "VeryLazy",
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		"b0o/schemastore.nvim",
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		"jay-babu/mason-nvim-dap.nvim",
		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
		"mfussenegger/nvim-lint",
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		require("mason").setup()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofumpt" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			go = { "golangcilint" },
			css = { "stylelint" },
			zsh = { "shellcheck" },
			bash = { "shellcheck" },
			yaml = { "yamllint" },
			python = { "vulture" },
		}

		require("mason-nvim-lint").setup()

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		require("mason-nvim-dap").setup({
			ensure_installed = { "node2" },
			automatic_installation = true,
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"terraformls",
				"angularls",
				"awk_ls",
				"bashls",
				"cssls",
				"cssmodules_ls",
				"dockerls",
				"emmet_ls",
				"eslint",
				"svelte",
				"html",
				"jsonls",
				"sqlls",
				"lua_ls",
				"rust_analyzer",
				"tailwindcss",
				"ts_ls",
				"yamlls",
				"vimls",
				"gopls",
			},
		})

		local on_attach = function(client)
			local lsp_keymaps = require("lsp.keymaps")
			local lsp_autocommands = require("lsp.autocommands")
			local lsp_signs = require("lsp.signs")
			local lsp_handlers = require("lsp.handlers")
			lsp_keymaps.init()
			lsp_autocommands.init(client)
			lsp_signs.init()
			lsp_handlers.init()
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				require("lspconfig")["lua_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = { Lua = { diagnostics = { globals = { "vim" } } } },
				})
			end,

			["gopls"] = function()
				require("lspconfig")["gopls"].setup({
					analyses = { unusedparams = true },
					staticcheck = true,
					gofumpt = true,
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			["jsonls"] = function()
				require("lspconfig")["jsonls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					init_options = { provideFormatter = false },
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				})
			end,

			["ts_ls"] = function()
				local react_filter = require("lsp.react-filter")
				--     -- local util = require 'lspconfig.util'
				require("lspconfig")["ts_ls"].setup({
					capabilities = capabilities,
					-- root_dir = function(fname)
					--     return util.root_pattern('.git')(fname)
					-- end,
					handlers = { ["textDocument/definition"] = react_filter },
					debounce_text_changes = 150,
					on_attach = function(client, bufnr)
						local ts_utils = require("nvim-lsp-ts-utils")
						ts_utils.setup({
							eslint_enable_diagnostics = false,
							disable_commands = false,
							-- eslint_enable_disable_comments = true,
							enable_formatting = false,
							update_imports_on_move = true,
							require_confirmation_on_move = false,
							watch_dir = nil,
						})

						client.server_capabilities.document_formatting = false
						ts_utils.setup_client(client)
						on_attach(client, bufnr)
					end,
				})
			end,
		})
	end,
}
