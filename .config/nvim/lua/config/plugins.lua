return {

    --{{{1 COLOURSCHEME --
    -- Used to change colourschemes on the fly
    {
        "rktjmp/lush.nvim",
    },
    -- Uses changes in fonts and italics/bold as syntax highlighting.
    {
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim", -- plugin for adjusting colourschemes
        config = function() require("config.colors.zenbones") end
    },
    --}}}1

    --{{{1 LSP

    --{{{2 LSPCONFIG
    {
        "neovim/nvim-lspconfig",
        --lazy = true,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            require("config.plugin.lsp")
        end

    },
    --}}}2

    --{{{2 MASON --
    -- install different Language Server Protocols (LSPs) used for syntax highlighting, linting, diagnostics and probably more!
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        event = "User FileOpened",
        --lazy = true,
        config = function()
            require("config.plugin.mason")
        end
    },
    --}}}2

    --{{{2 MASON-LSP
    -- connects Mason to lspconfig plugins
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        --lazy = true,
        --event = "User FileOpened",
        dependencies = "williamboman/mason.nvim",
        config = function()
            require("mason-lspconfig")
        end
    },
    --}}}2
   --}}}1

    --{{{1 COMPLETION
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("config.plugin.cmp")
        end
    },
    --}}}1

    --{{{1 TELESCOPE --
    -- great for file navigation from within neovim and fuzzy finding a search phrase.
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim", --lua library containing a bunch of functions for plugin devs.
            -- BurntSushi/ripgrep --    -- NOT A NVIM PLUGIN, improves Telescope fuzzy finding
        },
        --[[ EMPTY
        config = function()
            require("config.plugin.telescope")
        end
        --]]
    },
    --}}}1

    --{{{1 VIMTEX --
    -- latex IDE for vim
    {
        "lervag/vimtex",
        lazy = false, -- already lazy loaded by default
        config = function()
            require("config.plugin.vimtex")
        end
    },
    --}}}1

    --{{{1 GIT --
    -- gitsigns provides symbols that indicate changes, deletions and additions compared to previous git commit.
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
          require("config.plugin.gitsigns")
        end
    },
    --}}}1

    --{{{1 TREESITTER --
    -- superior highlighting for (many!) supported languages
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" }, -- Load on these events
        config = function()
            require("config.plugin.treesitter")
        end
    },
    --}}}1

    --{{{1 TREE --
    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        --dependencies = { "nvim-tree/nvim-web-devicons" }, -- for icons: REQUIRES A PATCHED FONT
        config = function()
            require("config.plugin.nvimtree")
        end
    },
    --}}}1

    --{{{1 SNIPPETS
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "1.2.1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp",
        config = function()
            require("config.plugin.luasnip")
        end
    },
    --}}}1

    --{{{1 DEV --
    -- my zettelkasten plugin
    {
        dir = "~/dev/neoZK.nvim/",
        dev = true,
        dependencies = {"luafun/luafun"}
    },
    --}}}1
}

