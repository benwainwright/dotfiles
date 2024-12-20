return {
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup({ disable_on_zoom = true, mux = "auto" })
		end,
		keys = {
			{ "<C-j>", "<cmd>NavigatorDown<cr>" },
			{ "<C-k>", "<cmd>NavigatorUp<cr>" },
			{ "<C-h>", "<cmd>NavigatorLeft<cr>" },
			{ "<C-l>", "<cmd>NavigatorRight<cr>" },
		},
	},
	{
		"benwainwright/fzf-project",
		priority = 1000,
		keys = {
			{ "<leader>cd", "<cmd>FzfSwitchProject<cr>" },
			{ "<C-f>", "<cmd>FzfChooseProjectFile<cr>" },
		},

		config = function()
			vim.g.fzf_history_dir = "~/.local/share/fzf-history"

			vim.g.fzfSwitchProjectProjects = {
				{
					path = "~/",
					name = "Home dir",
					command = "fd --hidden --max-depth 1 --type file",
				},
				{
					path = "~/.config",
					command = "fd --type file",
					name = "Config files",
				},
			}

			vim.g.fzfSwitchProjectWorkspaces = { "~/repos" }
			vim.keymap.set("n", "<leader>cd", "<cmd>FzfSwitchProject<CR>")
			vim.keymap.set("n", "<C-f>", "<cmd>FzfChooseProjectFile<CR>")
		end,

		dependencies = {
			"tpope/vim-fugitive",
			"junegunn/fzf",
			"junegunn/fzf.vim",
		},
	},
	{
		"rgroli/other.nvim",
		opts = {
			mappings = {
				{
					pattern = "/(.*).spec.tsx",
					target = "/%1.tsx",
					context = "implementation",
				},
				{
					pattern = "/(.*).spec.tsx",
					target = "/%1.component.tsx",
					context = "implementation",
				},
				{
					pattern = "/(.*).spec.tsx",
					target = "/%1.page.tsx",
					context = "implementation",
				},
				{
					pattern = "/(.*).spec.ts",
					target = "/%1.ts",
					context = "implementation",
				},
				{
					pattern = "/(.*).component.tsx",
					target = "/%1.spec.tsx",
					context = "test",
				},
				{
					pattern = "/(.*).page.tsx",
					target = "/%1.spec.tsx",
					context = "test",
				},
				{ pattern = "/(.*).ts", target = "/%1.spec.ts", context = "test" },
				{
					pattern = "/(.*).tsx",
					target = "/%1.spec.tsx",
					context = "test",
				},
			},
		},
	},
}
