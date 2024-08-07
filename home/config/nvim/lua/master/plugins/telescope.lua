return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- path_display = { "smart" }, -- paths will be truncated
				mappings = {
					i = {
						["<C-up>"] = actions.move_selection_previous,
						["<C-down>"] = actions.move_selection_next,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob", "!.git/",
					"--glob", "!**/node_modules/**",
					"--no-ignore",
				},
				layout_config = {
					width = 0.9,
					height = 0.9,
					prompt_position = "top",
					preview_cutoff = 0,
					preview_width = 0.5,
				},
			},
			pickers = {
				find_files = {
					previewer = true,
					find_command = { "fd", "--type", "f", "--hidden", "--no-ignore", "--exclude", ".git", "--exclude", "node_modules", "--exclude", "**/node_modules/**" },
				},
				oldfiles = {
					previewer = true,
				},
				live_grep = {
					previewer = true,
					additional_args = function(opts)
						return {"--glob", "!.git/", "--glob", "!**/node_modules/**"}
					end,
				},
				grep_string = {
					previewer = true,
					additional_args = function(opts)
						return {"--glob", "!.git/", "--glob", "!**/node_modules/**"}
					end,
				},
				buffers = {
					previewer = true,
				},
				keymaps = {
					previewer = true,
				},
				filetypes = {
					previewer = true,
				},
			},
			extensions = {
				["ui_select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui_select")

		local keymap = vim.keymap
		local tsb = require("telescope.builtin")

		keymap.set("n", "<leader>ff", tsb.find_files, { desc = "Telescope [F]ind [F]iles in cwd" })
		keymap.set("n", "<leader>fr", tsb.oldfiles, { desc = "Telescope [F]ind [R]ecent files" })
		keymap.set("n", "<leader>fs", tsb.live_grep, { desc = "Telescope [F]ind [S]tring in cwd" })
		keymap.set("n", "<leader>fc", tsb.grep_string, { desc = "Telescope [F]ind [C]ursor in cwd" })
		keymap.set("n", "<leader>fb", tsb.buffers, { desc = "Telescope [F]ind [B]uffers" })
		keymap.set("n", "<leader>fk", tsb.keymaps, { desc = "Telescope [F]ind [K]eymaps" })
		keymap.set("n", "<leader>ft", tsb.filetypes, { desc = "Telescope [F]ind [K]filetypes" })
		keymap.set("n", "<leader>/", tsb.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search in current buffer" })

		keymap.set("n", "<leader>fn", function()
			tsb.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })

		keymap.set("n", "<leader>f.", function()
			tsb.find_files({ cwd = "~/.system-dotfiles/" })
		end, { desc = "[F]ind [.]System files" })

		keymap.set("n", "<leader>fg", function()
			tsb.live_grep({
				additional_args = function(opts)
					return { "--max-count=1", "--glob", "!.git/", "--glob", "!**/node_modules/**" }
				end
			})
		end, { desc = "Telescope [F]ind unique [G]rep" })
	end,
}
