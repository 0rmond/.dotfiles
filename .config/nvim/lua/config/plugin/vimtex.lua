return function()

    --[[
    vim.g.vimtex_compiler_clean_paths = {
        "*.aux",
        "*.fdb_latexmk",
        "*.fls",
        "*.out",
        "*.log",
        "*.syntex.gz"
    }

    vim.g.vimtex_compiler_latexmk = {
        aux_dir = "./aux/",
        out_dir = "./out/"
    }
    vim.g.vimtex_compiler_latexmk = {
        options = { "-shell-escape", "-pdf" }
    }
    --]]
    vim.g.vimtex_complete_close_braces = 1
    vim.g.vimtex_view_method = "zathura"
end

