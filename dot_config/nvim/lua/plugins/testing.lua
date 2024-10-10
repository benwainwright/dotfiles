return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "marilari88/neotest-vitest", "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            { "fredrikaverpil/neotest-golang", version = "*" },

        },

        config = function()
            require("neotest").setup({
                adapters = {
                  require("neotest-vitest"),
                  require("neotest-golang")
                },
                log_level = vim.log.levels.DEBUG
            })
        end
    }
}
