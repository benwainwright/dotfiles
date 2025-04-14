return {
  { "nvim-lua/plenary.nvim", lazy = false },
  {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup({
        auto_reload = true,
        commands = true
      })
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" },
      "nvim-neotest/neotest-plenary",
    },

    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-golang"),
          require("neotest-plenary"),
        },
        log_level = vim.log.levels.DEBUG,
      })
    end,
  },
}
