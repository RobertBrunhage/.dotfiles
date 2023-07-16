vim.opt.splitright = true

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>")

require("nvim-tree").setup({
	update_focused_file = {
		enable = false,
		update_cwd = true,
	},
	disable_netrw = false,
	hijack_netrw = false,
})
