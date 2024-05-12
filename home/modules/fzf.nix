{ config, ... }:

{
	programs.fzf = {
		enable = true;
		enableZshIntegration = true;

		defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
		fileWidgetOptions = [ "--preview 'bat --color=always --style=header,grid --line-range :500 {}' --preview-window=right:60%:wrap" ];
		
		colors = {
			fg = "#${config.colorScheme.colors.base09}";
			bg = "#${config.colorScheme.colors.base00}";
			hl = "#${config.colorScheme.colors.base0D}";
			marker = "#${config.colorScheme.colors.base0D}";
			header = "#${config.colorScheme.colors.base0D}";
			"fg+" = "#${config.colorScheme.colors.base0A}";
			"bg+" = "#${config.colorScheme.colors.base00}";
			"hl+" = "#${config.colorScheme.colors.base0D}";
		};
	};
}
