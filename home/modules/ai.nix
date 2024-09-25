{ pkgs, ... }:

{
  home.packages = with pkgs; [
		ollama-cuda
		python312Packages.ollama
	];
}
