local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

lsp_zero.preset("minimal")

lsp_zero.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
})

-- Fix Undefined global 'vim'
lsp_zero.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set({ "n", "i" }, "<C-b>", function()
		vim.lsp.buf.inlay_hint(0, nil)
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>dl", function()
		vim.diagnostic.setqflist()
	end, opts)
end

lsp_zero.on_attach(on_attach)

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

lsp_config["dartls"].setup({
	on_attach = on_attach,
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

lsp_zero.setup()

local cmp = require("cmp")

local cmp_mappings = cmp.mapping.preset.insert({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-y>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({ select = false }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = vim.NIL
cmp_mappings["<S-Tab>"] = vim.NIL

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},
	mapping = cmp_mappings,
})

require("fidget").setup({})
