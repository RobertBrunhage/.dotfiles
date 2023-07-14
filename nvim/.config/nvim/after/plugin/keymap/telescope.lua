vim.keymap.set("n", "<leader>tb", ":lua require('telescope.builtin').buffers()<CR>")
vim.keymap.set("n", "<leader>to", ":lua require('telescope.builtin').oldfiles()<CR>")
vim.keymap.set(
	"n",
	"<leader>tlb",
	":lua require('telescope.builtin').git_branches({show_remote_tracking_branches = false})<CR>"
)
vim.keymap.set("n", "<leader>tlrb", ":lua require('telescope.builtin').git_branches()<CR>")
vim.keymap.set("n", "<leader>tgg", ":lua require('telescope.builtin').live_grep()<CR>")
vim.keymap.set("n", "<leader>th", ":lua require('telescope.builtin').help_tags()<CR>")
vim.keymap.set("n", "<leader>tc", ":lua require('telescope.builtin').commands()<CR>")
vim.keymap.set("n", "<leader>ts", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")

vim.keymap.set("n", "<C-p>", ":lua require'telescope.builtin'.git_files()<CR>")
