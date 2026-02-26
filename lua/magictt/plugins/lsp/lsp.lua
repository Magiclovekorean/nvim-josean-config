return {
    {
      "hrsh7th/cmp-nvim-lsp", event = { "BufReadPre", "BufNewFile" },
    dependencies = {
       { "antosha417/nvim-lsp-file-operations", config = true },
       { "folke/lazydev.nvim", opts = {} },
       { "neovim/nvim-lspconfig" },
       },
    config = function()

       -- import cmp-nvim-lsp plugin
       local cmp_nvim_lsp = require("cmp_nvim_lsp")

       -- used to enable autocompletion (assign to every lsp server config)
       local capabilities = cmp_nvim_lsp.default_capabilities()


       -- Auto-format on save for web files
       vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.ts" },
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
       })

    end,
  },
}
