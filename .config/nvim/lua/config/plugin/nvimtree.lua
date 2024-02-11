-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local keymaps =
require("nvim-tree").setup({
    sort_by = "modification_time",
    hijack_cursor = true,
    system_open = { cmd = "nvim" },

    diagnostics = {
        enable = true,
        debounce_delay = 50,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    git = {
        enable = true,
        ignore = true, -- ignores gitignore files
        show_on_dirs = true,
    },

    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },

    view = {
        width = 30,
        side = "left",
        signcolumn = "yes",
    },

    renderer = {
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            modified_placement = "after",
        },
        add_trailing = true, --folders have "/" after their name
        group_empty = true, -- collapse folders with only one folder in them
        highlight_git = true,
        highlight_opened_files = "name",
        highlight_modified = "icon",
    },
    filters = {
        dotfiles = true,
    },
})
