local nnoremap = require("robert.keymap").nnoremap
local xnoremap = require("robert.keymap").xnoremap
local vnoremap = require("robert.keymap").vnoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<leader>sv", ":vsplit <CR>")
nnoremap("<leader>sh", ":split <CR>")

xnoremap("p", "pgvy")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<leader>f", function()
  vim.lsp.buf.format()
end)

nnoremap("<S-d>", "<cmd>cnext<CR>zz")
nnoremap("<S-u>", "<cmd>cprev<CR>zz")

nnoremap("<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<leader>ft", ":silent !flutter-test %:p<CR>")
nnoremap("<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
