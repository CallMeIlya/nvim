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

require("nord").setup()

print("core OK")
