return {
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/lazydev.nvim", opts = {} },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.enable("pyright")

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.ts" },
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })
    end,
  },
}

