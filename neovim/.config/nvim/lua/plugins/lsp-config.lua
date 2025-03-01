return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "csharp_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.csharp_ls.setup({})
    end,

    keys = function()
      return {
        { "<F4>", vim.lsp.buf.hover },
        { "<F2>", vim.lsp.buf.definition },
        { "<leader>ca", vim.lsp.buf.code_action },
        { "<F3>", vim.lsp.buf.implementation },
        { "<leader>cl", vim.lsp.buf.references },
      }
    end,
  },
}
