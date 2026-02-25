vim.lsp.config('clangd', {
  -- Server-specific settings. See `:help lsp-quickstart`
  settings = {
    ['rust-analyzer'] = {},
  },
})
print("lspconfig OK")
