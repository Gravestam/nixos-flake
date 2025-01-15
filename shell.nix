{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

	nativeBuildInputs = with pkgs; [
		python312
		python312Packages.pip
		python312Packages.pyautogui
		python312Packages.keyboard
		python312Packages.opencv4
	];

	shellHook = ''
		echo "DEV SHELL"
	'';
}
