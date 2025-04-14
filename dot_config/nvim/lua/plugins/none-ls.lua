return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = { "lukas-reineke/lsp-format.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.prettier.with {
        --     filetypes = {
        --         "html", "svelte", "typescript", "javascript", "react"
        --     }
        -- }, null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.mdformat,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.formatting.yamlfmt,
      },
      on_attach = function(client)
        require("lsp-format").on_attach(client)
      end,
    })
  end,
}
