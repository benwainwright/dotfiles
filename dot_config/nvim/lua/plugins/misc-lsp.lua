return {
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
