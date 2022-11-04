return require("packer").startup(function(use)
    use "rktjmp/lush.nvim"
    use "metalelf0/jellybeans-nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "tribela/vim-transparent"
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "rust" },
        sync_install = true,
        highlight = {
            enable = true,
        }
    }
    use "wbthomason/packer.nvim"
    use {
        "ellisonleao/gruvbox.nvim", as = gruvbox,
    }
    use {
        "mattn/emmet-vim", as = emmet,
    }
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        contrast = "medium",
        transparent_mode = true
    })
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                flavour = "mocha" -- mocha, macchiato, frappe, latte
            }
            vim.api.nvim_command "colorscheme catppuccin"
        end
    }
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        transparent_background = false,
        term_colors = false,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    })
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    require("nvim-tree").setup()
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
    require"mason".setup{}
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
    require('bufferline').setup{}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    require('lualine').setup {
        options = {
            -- ... your lualine config
            theme = 'tokyonight'
            -- ... your lualine config
        }
    }
    use 'folke/tokyonight.nvim'
    use "neovim/nvim-lspconfig"
    require"lspconfig".rust_analyzer.setup{}
    require"lspconfig".clangd.setup{}
    use "simrat39/rust-tools.nvim"
    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
end)
