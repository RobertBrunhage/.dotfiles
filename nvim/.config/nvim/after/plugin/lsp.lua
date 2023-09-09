local lsp_config = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set({ "n", "i" }, "<C-b>", function()
			vim.lsp.buf.inlay_hint(0, nil)
		end, opts)
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

lsp_config["dartls"].setup({
	capabilities = capabilities,
	cmd = {
		"dart",
		"language-server",
		"--protocol=lsp",
		-- "--port=8123",
		-- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
	},
	filetypes = { "dart" },
	init_options = {
		onlyAnalyzeProjectsWithOpenFiles = false,
		suggestFromUnimportedLibraries = true,
		closingLabels = true,
		outline = false,
		flutterOutline = false,
	},
	settings = {
		dart = {
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/tools/flutter/"),
			},
			updateImportsOnRename = true,
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
})

lsp_config.tsserver.setup({
	capabilities = capabilities,
})

lsp_config.lua_ls.setup({
	capabilities = capabilities,
})

-- some tooltip for the lsp in bottom right
require("fidget").setup({})

-- hot reload :)
require("dart-tools")
