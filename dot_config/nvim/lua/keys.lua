local vim = require("nvim-api")

vim.exec('let mapleader = "\\<Space>"')
vim.exec('let maplocalleader = "\\\\"')
vim.exec('let mapleader = "\\<Space>"')
vim.exec('let maplocalleader = "\\\\"')

vim.maps({
	n = {
		{ key = "<C-j>", command = "NavigatorDown" },
		{ key = "<C-k>", command = "NavigatorUp" },
		{ key = "<C-h>", command = "NavigatorLeft" },
		{ key = "<C-l>", command = "NavigatorRight" },
		{ key = "<leader>td", lua = "require('neotest').run.run({strategy = 'dap'})" },
		{ key = "<leader>tr", lua = "require('neotest').run.run()" },
		{ key = "<leader>dt", lua = "require('dapui').toggle()" },
		{ key = "<leader>ts", lua = "require('neotest').summary.toggle()" },
		{ key = "<leader>tw", lua = "require('neotest').watch.toggle()" },
		{ key = "<leader>to", lua = "require('neotest').output_panel.toggle()" },
		{ key = "nd", lua = "require('notify').dismiss()" },
		{ key = "nh", lua = "require('notify').history()" },
		{ key = "<leader>o", command = "Other" },
		{ key = "<leader>G", command = "Ag" },
		{ key = "<C-b>", command = "Buffers" },
		{ key = "<leader>cp", command = "vs ~/.config/nvim/lua/plugins.lua" },
		{ key = "<leader>cp", command = "vs ~/.config/nvim/lua/keys.lua" },
		{ key = "<leader>cp", command = "vs ~/.config/nvim/lua/lsp.lua" },
	},
})
