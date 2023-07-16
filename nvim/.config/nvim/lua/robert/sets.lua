vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.guicursor = "n-v-c-i:block"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Stop auto commenting -> help fo-table
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

vim.opt.colorcolumn = "80"

-- I don't think this works for WSL on Windows or Windows in general
vim.opt.updatetime = 50
