vim.opt.runtimepath:prepend("~/.local/share/nvim/site/pack/packer/start/lazy.nvim")

require("lazy").setup({

  { "shaunsingh/nord.nvim"},
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "mason-org/mason.nvim", opts = {}},
  { 'nvim-lualine/lualine.nvim', 
    dependencies = { 
      'nvim-tree/nvim-web-devicons' 
    }
  },
  { "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",  -- mason.nvim is a dependency
      "neovim/nvim-lspconfig", -- nvim-lspconfig is another dependency
    }
  },
  {'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  { "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({})
      vim.cmd.colorscheme("nord")
    end,
  },
  install = {
    colorscheme = { "nord" },
  },
  { "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  }, 
})

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
require('lspconfig').clangd.setup {
  capabilities = capabilities,
}

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'nord'
    -- ... your lualine config
  }
}
  
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'rust', 'c', 'cpp', 'java', 'latex' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'c', 'h', 'java' },
  callback = function() vim.treesitter.start() end,
})

vim.cmd.colorscheme("nord")

