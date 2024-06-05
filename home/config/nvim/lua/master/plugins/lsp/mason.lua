return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "",
					package_pending = "󰔟",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- LSP
				"tsserver", -- JavaScript, TypeScript
				"html", -- HTML
				"cssls", -- CSS, SCSS, LESS
				"svelte", -- Sveltekit, Svelte
				"lua_ls", -- Lua
				"nil_ls", -- Nix
				"emmet_ls", -- Emmet
				"pyright", -- Python
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Linters
				"eslint_d", -- JavaScript, TypeScript
				"flake8", -- Python

				-- Formatters
				"prettier", -- Angular, CSS, Flow, GraphQL, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
				"stylua", -- Lua, Luau
				"black", -- Python
				"beautysh", -- Bash, Csh, Ksh, Sh, Zsh
				"nixpkgs-fmt", -- Nix
			},
		})
	end,
}
