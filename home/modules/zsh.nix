{ config, ... }:

{

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases =
      let
        nixConfigDir = "~/.system-dotfiles";
      in
      {
        system_update = "sudo nix flake update ${nixConfigDir}";
        system_rebuild = "nh os switch ${nixConfigDir}";
        home_rebuild = "nh home switch ${nixConfigDir}"; # "home-manager switch --flake ${nixConfigDir}";
        conf = "nvim ${nixConfigDir}";
        l = "exa -lhg --icons --time-style long-iso --sort=type -L2";
        ll = "exa -lahg --icons --time-style long-iso --sort=type -L2";
        mkdir = "mkdir -p";
        rm = "rm -i";
        mv = "mv -i";
        ".." = "cd ..";
        v = "nvim";
        sv = "sudo nvim";
        ff = "fastfetch";
        fm = "ranger";
        grep = "rg";
        cat = "bat";
        bt = "bluetoothctl";
        tm = "tmux";
        tml = "tmux ls";
        tma = "tmux attach -t";
        tmk = "tmux kill-session -t";
        tmka = "tmux kill-server";
        startHyprland = "dbus-run-session Hyprland";
        ai = "${config.xdg.dataHome}/projects/node-ai/main.js shell";
        yarn_force_dir = "${config.xdg.dataHome}/projects/glimworks/retailer_config/yarn_force";
				shithost = "TERM=xterm-256color";
      };

    initExtra = "[ -f ~/.fzf_colors ] && source ~/.fzf_colors";
  };
}
