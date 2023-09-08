local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
vim.keymap.set("n", "<leader>to", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>tlb", function()
	builtin.git_branches({ show_remote_tracking_branches = false })
end, {})

vim.keymap.set("n", "<leader>tlrb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>tgg", require("telescope").extensions.live_grep_args.live_grep_args)
vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
vim.keymap.set("n", "<leader>tc", builtin.commands, {})

vim.keymap.set("n", "<leader>ts", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>tf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

require("telescope").setup({
	defaults = require("telescope.themes").get_dropdown({
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-x>"] = false,
			},
		},
	}),
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		["ui-select"] = {
			specific_opts = {
				codeactions = false,
			},
		},
	},
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("ui-select")
