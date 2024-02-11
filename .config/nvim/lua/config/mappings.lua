local Mappings = {}
local mappings = {}
local default_opts = { noremap = true, silent = true }

-- the keys for the mappings represent the vim mode that the mapping is used in. Confused? Check out :h nvim_set_keymap and have a look at {mode}.

--TODO: Maybe migrate some of these in a similar way to how nvim-cmp has had to be configured?

Mappings.core = {
    n = {
        ["A-j"] = ":m .+1<CR>==",
        ["A-k"] = ":m .-1<CR>==",
    },
}
--{{{1 TELESCOPE
local TELESCOPE = require("telescope.builtin")
Mappings.telescope = {
    n = {
        ["gd"] = function() TELESCOPE.lsp_definitions() end, -- Go Definition
        ["<leader>ff"] = function() TELESCOPE.find_files() end, -- Find Files
        ["<leader>fw"] = function() TELESCOPE.live_grep() end, -- Find Word(s)
        ["<leader>pf"] = function() TELESCOPE.git_files() end, -- Project Files
        ["<leader>gb"] = function() TELESCOPE.git_branches() end, -- Git Branches
        ["<leader>gc"] = function() TELESCOPE.git_commits() end, -- Git Commits
        ["<leader>gw"] = function() TELESCOPE.git_status() end, -- Git Work in Progress
        ["leader>gs"] = function() TELESCOPE.git_stash() end, -- Git Stash (list them)
    },
}

--}}}1 TELESCOPE

--{{{1 LSP
Mappings.lsp = {
    -- TODO: Look at https://github.com/neovim/nvim-lspconfig for some keymappings to potentially implement?
    n = {
        ["K"] = function() vim.lsp.buf.hover() end,
    },
}
--}}}1

--{{{1 TREE
local NVIMTREE = require("nvim-tree.api")
Mappings.nvimtree = {
    n = {
        ["<leader>of"] = function() NVIMTREE.tree.toggle() end, -- Outline Files
    },
}
--}}}1

--{{{1 LUASNIP
--[[ TODO: Implement properly
local SNIPPET = require("luasnip")
Mappings.luasnippets = {
    i = {
        ["<C-k>"] = function() SNIPPET.expand() end,
        ["<C-l>"] = function() SNIPPET.jump(1) end,
        ["<C-j>"] = function() SNIPPET.jump(-1) end,
    },
}
--]]
--}}}1

--{{{1 COMPLETION

local CMP = require("cmp")
local select_opts = { behavior = CMP.SelectBehavior.Select }
mappings.nvimcmp = {
    ["<C-u>"] = CMP.mapping.scroll_docs(-4),
    ["<C-d>"] = CMP.mapping.scroll_docs(4),
    ["<C-j>"] = CMP.mapping.select_next_item(select_opts),
    ["<C-k>"] = CMP.mapping.select_prev_item(select_opts),
    ["<C-e>"] = CMP.mapping.abort(),
    ["<Tab>"] = CMP.mapping(function(tab_as_usual)
        if CMP.visible() then
            local entry = CMP.get_selected_entry()
            if not entry then
                CMP.select_next_item(select_opts)
                CMP.confirm()
            else CMP.confirm() end
        else tab_as_usual() end
    end, {'i', 's', 'c'}),
}
--}}}1

for plugin, keymaps in pairs(Mappings) do
    for mode, mappings in pairs(keymaps) do
        for keypress, action in pairs(mappings) do
            vim.keymap.set(mode, keypress, action, default_opts)
        end
    end
end

return mappings

