return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- text in buffers
		"hrsh7th/cmp-path", -- file system paths
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip", -- autocompletion
		"rafamadriz/friendly-snippets", -- snippets
		"onsails/lspkind.nvim", -- pictorgrams
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load() -- load snippets from installed plugins

		cmp.setup({
			completion = { 
				completeopt = "menu,menuone,preview,noselect",
				autocomplete = false -- When set to false, it will only show if toggled and will be hidden by default (less noisy while getting shit done...)
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- mapping = cmp.mapping.preset.insert({
			-- 	["<C-down>"] = cmp.mapping.select_prev_item(),
			-- 	["<C-up>"] = cmp.mapping.select_next_item(),
			-- 	["<C-Space>"] = cmp.mapping.complete(),
			-- 	["<C-e>"] = cmp.mapping.abort(),
			-- 	["<C-y>"] = cmp.mapping.confirm({ select = false }),
			-- }),
			mapping = cmp.mapping({
				["<C-up>"] = cmp.mapping.select_prev_item(),
				["<C-down>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer", max_item_count = 5 },
				{ name = "copilot" },
				{ name = "path", max_item_count = 3 },
				{ name = "luasnip", max_item_count = 3 },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = { Copilot = "" },
				}),
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded", -- single, double, rounded, solid, shadow
					col_offset = -3,
					side_padding = 1,
					scrolloff = 1,
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					col_offset = 1,
					row_offset = 1,
					max_width = 80,
					max_height = 20,
				}),
			},
		})
	end,
}
