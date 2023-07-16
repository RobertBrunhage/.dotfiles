require("nvim-treesitter.configs").setup({
	ensure_installed = { "dart" },
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = {
		enable = true,
		-- indentation in dart is borken and I am too lazy
		disable = { "dart" },
	},
})
