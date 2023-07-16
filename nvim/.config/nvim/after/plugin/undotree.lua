local undotree = require("undotree")

vim.keymap.set("n", "<leader>u", undotree.toggle, { silent = true })

undotree.setup({
	keymaps = {
		["j"] = "move_next",
		["k"] = "move_prev",
		["J"] = "move_change_next",
		["K"] = "move_change_prev",
		["<cr>"] = "action_enter",
		["p"] = "enter_diffbuf",
		["q"] = "quit",
	},
})
