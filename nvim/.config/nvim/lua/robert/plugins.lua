local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

	"mhartington/formatter.nvim",

	-- File and folder management
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"ThePrimeagen/harpoon",

	-- POG
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- File explorer
	"kyazdani42/nvim-tree.lua",
	"ryanoasis/vim-devicons",

	-- Snippets
	"RobertBrunhage/flutter-riverpod-snippets",
	"Neevash/awesome-flutter-snippets",

	-- Language support, mainly for indentation
	"dart-lang/dart-vim-plugin",

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- },
	{
		dir = "~/personal/projects/nvim-treesitter",
	},
	"nvim-treesitter/nvim-treesitter-context",
	-- { dir = "~/personal/projects/nvim-treesitter-context" },

	-- Nice to have
	"numToStr/Comment.nvim",
	"github/copilot.vim",
	{ "j-hui/fidget.nvim", tag = "legacy" },

	-- Git
	"tpope/vim-fugitive",

	-- UI
	"f-person/auto-dark-mode.nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
}

require("lazy").setup(plugins, {})
