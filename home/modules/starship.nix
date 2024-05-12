{ config, lib, ... }:

let 
	colors = config.colorScheme.colors;

# scheme: "Tokyo Night Dark"
# author: "Michaël Ball"
# base00: "#1A1B26"
# base01: "#16161E"
# base02: "#2F3549"
# base03: "#444B6A"
# base04: "#787C99"
# base05: "#A9B1D6"
# base06: "#CBCCD1"
# base07: "#D5D6DB"
# base08: "#C0CAF5"
# base09: "#A9B1D6"
# base0A: "#0DB9D7"
# base0B: "#9ECE6A"
# base0C: "#B4F9F8"
# base0D: "#2AC3DE"
# base0E: "#BB9AF7"
# base0F: "#F7768E"
in {
	programs.starship = {
		enable = true;
		enableZshIntegration = true;

		settings = {
			scan_timeout = 10;
			add_newline = false;
			line_break = { disabled = false; };
			
			format = lib.concatStrings [
				"[╭─](#${colors.base03}) $username$hostname [─](#${colors.base03}) $directory $git_branch $git_status $git_metrics"
				"\n"
				"[╰──](#${colors.base03}) $sudo$character"
			];

			right_format = lib.concatStrings [
				"$status"
				" "
				"$time"
			];

			character = {
				success_symbol = "[󰘧 ](bold #${colors.base0B})";
				error_symbol = "[󰘧 ](bold #${colors.base0F})";
				vimcmd_symbol = "[󰘧 ](bold #${colors.base0D})";
				format = "$symbol";
			};
			package = { disabled = true; };
			username = {
				disabled = false;
				style_user = "bold #${colors.base0B}";
				style_root = "bold #${colors.base0B}";
				format = "[$user]($style)";
				show_always = true;
			};
			hostname = {
				disabled = false;
				ssh_only = true;
				style = "bold #${colors.base0B}";
				format = "@[$hostname]($style)";
				trim_at = ".companyname.com";
			};
			directory = {
				disabled = false;
				truncation_length = 3;
				truncation_symbol = "…/";
				truncate_to_repo = false;
				read_only = "";
				read_only_style = "#${colors.base0F}";
				home_symbol = "~";
				style = "#${colors.base0A}";
				format = "[$path]($style)[$read_only]($read_only_style)";
			};
			time = {
				disabled = false;
				use_12hr = false;
				style = "bold #${colors.base03}";
				format = "[$time]($style)";
				time_format = "%T";
				utc_time_offset = "local";
				time_range = "-";
			};
			status = {
				disabled = false;
				style = "#f8f8f2";
				symbol = "[ $int](bold #${colors.base0F})";
				success_symbol = "[](bold #${colors.base0B})";
				not_executable_symbol = "[ $int](bold #${colors.base0F})";
				not_found_symbol = "[ $int](bold #e0af68)";
				sigint_symbol = "[ $int](bold #e0af68)";
				signal_symbol = "[ $int](bold #e0af68)";
				format = "[$symbol]($style)";
				map_symbol = true;
				recognize_signal_code = true;
			};
			sudo = {
				disabled = false;
				style = "bold #ff9e64";
				symbol = "";
				format = "[$symbol]($style) ";
			};
			git_branch = {
				disabled = false;
				symbol = "";
				style = "bold #${colors.base0E}";
				truncation_length = 6;
				truncation_symbol = "...";
				ignore_branches = [];
				format = "[$symbol $branch(:$remote_branch)]($style)";
			};
			git_commit = {
				disabled = false;
				commit_hash_length = 4;
				tag_symbol = "🔖 ";
			};
			git_status = {
				disabled = false;
				conflicted = "[󱃘](#${colors.base0F}) ";
				ahead = "[ $count](#ff9e64)";
				diverged = "[ \${ahead_count} /  \${behind_count}](#ff9e64)";
				behind = "[ $count](#ff9e64)";
				up_to_date = "[](#${colors.base0B})";
				untracked = "[](#ff9e64)";
				stashed = "[](#ff9e64)";
				modified = "[](#ff9e64)";
				staged = "[$count](#${colors.base0B})";
				renamed = "[󰑕](#ff9e64)";
				deleted = "[󰆴](#${colors.base0F})";
				format = "[─ ](#${colors.base03})$all_status$ahead_behind[ ─](#${colors.base03})";
			};
			git_metrics = {
				disabled = false;
				only_nonzero_diffs = true;
				added_style = "#${colors.base0B}";
				deleted_style = "#${colors.base0F}";
				format = "[─ ](#${colors.base03})[$added]($added_style)/[$deleted]($deleted_style)[ ─](#${colors.base03})";
			};
		};
	};
}
