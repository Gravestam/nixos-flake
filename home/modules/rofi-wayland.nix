{ config, ... }:
let 
	colors = config.colorScheme.colors;
in {
	home.file = { 
		".config/test/config.rasi" = { text = ''
			${colors.base00}
		'';
		executable = false; };
	};
}
