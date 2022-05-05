set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set splitright


call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rstacruz/vim-closer'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neovim/nvim-lspconfig'

call plug#end()

lua require('treesitter-config')
lua << END
require('lualine').setup()
END

lua require("lsp_config")

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

colorscheme onehalfdark

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
