{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

	nativeBuildInputs = with pkgs; [
		python312
		python312Packages.pip
		python312Packages.pyautogui
		python312Packages.keyboard
	];

	shellHook = ''
		echo "DEV SHELL"
	'';
}
