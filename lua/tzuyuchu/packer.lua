vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'dracula/vim'

    if not vim.g.vscode then
        -- main one
        use { 'ms-jpq/coq_nvim', branch = 'coq' }
        -- 9000+ Snippets
        use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

        -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
        -- Need to **configure separately**
        use { 'ms-jpq/coq.thirdparty', branch = '3p' }
        -- - shell repl
        -- - nvim lua api
        -- - scientific calculator
        -- - comment banner
        -- - etc

        -- LSP
        use 'neovim/nvim-lspconfig'
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'

        use {
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function()
                vim.cmd('colorscheme rose-pine')
            end
        }

        use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'ThePrimeagen/harpoon'
        use 'mbbill/undotree'
        use 'wakatime/vim-wakatime'
        use {
            'mhinz/vim-startify',
            config = function ()
                vim.g.startify_skiplist = {'^/mnt/c'}
            end
        }
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use 'airblade/vim-gitgutter'
        use 'preservim/tagbar'

        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use {
            'preservim/nerdcommenter',
            config = function()
                vim.g.NERDSpaceDelims = 1
                vim.g.NERDTrimTrailingWhitespace = 1
                vim.keymap.set('n', '<C-/>', '<leader>c<space>')
            end
        }
        use 'folke/zen-mode.nvim'
    end

    use 'tpope/vim-fugitive'
    -- use 'lervag/vimtex'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'ludovicchabant/vim-gutentags'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'ggandor/leap.nvim'
    use 'tpope/vim-sleuth'
end)
