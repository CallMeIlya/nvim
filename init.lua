require("mason").setup()
require("mason-lspconfig").setup()
require("telescope").setup()
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'cpp', 'c', 'java' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'c', 'h', 'java' },
  callback = function() vim.treesitter.start() end,
})

require("core.mapping")
require("core.autocmd")
require("core.settings")
require("core.lspconfig")

require("nord")

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
--vim.lspconfig.clangd.setup {
--  capabilities = capabilities,
--}


require('lspconfig').clangd.setup {
  capabilities = capabilities,
}-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),

  sources = {
    { name = "nvim_lsp" },
  },
})

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine

--vim.lsp.config('clangd')

--vim.lsp.enable('clangd')


print("core OK")
