{ config, ... }:

let
  colors = config.colorScheme.colors;
in
{
  home.file = {
    ".fzf_colors" = {
      text = ''
        export FZF_DEFAULT_OPTS="--color bg:#${colors.base00},bg+:#${colors.base00},fg:#${colors.base05},fg+:#${colors.base09},header:#${colors.base0D},hl:#${colors.base0B},hl+:#${colors.base09},marker:#${colors.base0D}"
      '';
      executable = false;
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=header,grid --line-range :500 {}' --preview-window=right:60%:wrap"
    ];
  };
}
