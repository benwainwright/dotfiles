return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    ft = { "typescript", "typescriptreact" }
  },
  { "weilbith/nvim-code-action-menu", event = "VeryLazy" },
  { "kosayoda/nvim-lightbulb",        event = "VeryLazy" },
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
  },
  { "gfanto/fzf-lsp.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
