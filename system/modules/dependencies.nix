
{ config, pkgs, pkgs-unstable, ... }:

{
	environment.systemPackages = [ 
		pkgs-unstable.python312Packages.openai
		pkgs-unstable.python312Packages.termcolor
		pkgs-unstable.python312Packages.colorama
		pkgs-unstable.python312Packages.python-dotenv
		pkgs-unstable.python312Packages.distro
		pkgs-unstable.python312Packages.pyyaml
		pkgs-unstable.python312Packages.pyperclip
	];
}
