local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({
    capabilities = capabilities,
    filetypes = {"python"},
})
lspconfig.lua_ls.setup({
    capabilities = capabilities,
})
lspconfig.hls.setup{}