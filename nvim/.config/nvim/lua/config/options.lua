-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = ","

vim.opt.relativenumber = false

vim.opt.list = true
local space = "⋅"
vim.opt.listchars:append({
  tab = "▷⋅",
  trail = space,
  nbsp = space,
})

vim.g.snacks_animate = false
