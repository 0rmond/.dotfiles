-- contains different options --

local opt = vim.opt
local g = vim.g

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
