require("nvim-treesitter.configs").setup({
	ensure_installed = { "dart" },
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = {
		enable = true,
	},
})
