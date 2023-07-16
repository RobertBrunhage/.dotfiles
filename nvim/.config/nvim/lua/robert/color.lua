require("rose-pine").setup({
	dark_variant = "moon",
	light_variant = "dawn",
})

local auto_dark_mode = require("auto-dark-mode")

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option("background", "dark")
		vim.api.nvim_command("colorscheme rose-pine")
	end,
	set_light_mode = function()
		vim.api.nvim_set_option("background", "light")
		vim.api.nvim_command("colorscheme rose-pine")
	end,
})

auto_dark_mode.init()
