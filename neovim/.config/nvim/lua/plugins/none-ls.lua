return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
    })
  end,

  keys = function()
    return {
      { "<Leader>gf", vim.lsp.buf.format, desc = "Lint File" },
    }
  end,
}
