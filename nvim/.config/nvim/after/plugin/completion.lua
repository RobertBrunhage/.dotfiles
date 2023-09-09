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

---@diagnostic disable-next-line: missing-fields
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
	mapping = cmp_mappings,
})

-- Snippets will load from LSP but this makes sure to
-- load local and plugin snippets ASAP
require("luasnip.loaders.from_vscode").lazy_load()
