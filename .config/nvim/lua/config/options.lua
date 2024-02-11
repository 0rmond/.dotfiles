-- contains different options --

local opt = vim.opt
local api = vim.api
local g = vim.g

local function count_occurances_of(character, in_sequence)
    local _, number = in_sequence:gsub(character, '')
    return number
end

local function foldFromMarker(line_number)
    local current_line = vim.fn.getline(line_number)
    local next_line = vim.fn.getline(line_number+1)

    local current_line_starts_fold = current_line:gmatch("[{]")
    local current_line_ends_fold = current_line:gmatch("[}]")
    local next_line 
    if current_line_starts_fold then
        return '>'..count_occurances_of('{', current_line)
    elseif current_line_ends_fold then
        return '<'..count_occurances_of('}', current_line)
    else return '='
    end
end

-- UI --
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.numberwidth = 3
opt.syntax = "on"

-- UX --
opt.clipboard = "unnamedplus" --uses global clipboard
opt.mouse = "a"

-- EDITING --
opt.expandtab = true
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = true
opt.textwidth = 300
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.list = true
opt.listchars = "trail:·,nbsp:◇,tab:> ,extends:▸,precedes:◂"

-- FOLDING --
--{{{
opt.foldmethod = "marker"
opt.foldcolumn = "auto"
--opt.formatexpr = "foldFromMarker()"
--}}}

-- SEARCHING --
opt.ignorecase = true
opt.smartcase = true

-- MISTAKES WERE MADE --
opt.swapfile = true
opt.directory = "/tmp/nvim/"

-- BUFFERS --
opt.splitright = true
opt.splitbelow = true

-- LEADER --
g.mapleader = " "
g.maplocalleader = " "

-- COMPLETION --
opt.completeopt = { "menu", "menuone", "noselect" }
