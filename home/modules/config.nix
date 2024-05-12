let configdir = ../config;
in {
	home.file = {
		# ".config/alacritty".source = "${configdir}/alacritty";
		".config/bat".source = "${configdir}/bat";
		".config/fastfetch".source = "${configdir}/fastfetch";
		".config/hypr".source = "${configdir}/hypr";
		".config/nvim".source = "${configdir}/nvim";
		".config/ranger".source = "${configdir}/ranger";
		".config/rofi".source = "${configdir}/rofi";
		".config/starship.toml".source = "${configdir}/starship/starship.toml";
		".config/swappy".source = "${configdir}/swappy";
		".config/swaync".source = "${configdir}/swaync";
		".config/tmux".source = "${configdir}/tmux";
		".config/waybar".source = "${configdir}/waybar";
		# ".config/wezterm".source = "${configdir}/wezterm";
	};
}
