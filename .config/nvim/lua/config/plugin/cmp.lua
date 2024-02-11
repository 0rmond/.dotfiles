local cmp = require("cmp")
local keymaps = require("config.mappings").nvimcmp

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = keymaps,

    sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    }),
    window = { documentation = cmp.config.window.bordered() },
})
