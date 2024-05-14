-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000, -- make sure this loads asap...
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 		})
--
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	priority = 1000, -- make sure this loads asap...
	config = function()

		require("catppuccin").setup({
			flavor = "mocha" -- latte, frappe, macchiato, mocha
		});

		vim.cmd("colorscheme catppuccin")
	end,
}

