{ config, lib, ... }:

let
  colors = config.colorScheme.colors;
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      scan_timeout = 10;
      add_newline = false;
      line_break = {
        disabled = false;
      };

      format = lib.concatStrings [
        "[╭─](#${colors.base04}) $username$hostname [─](#${colors.base04}) $directory $git_branch $git_status $git_metrics"
        "\n"
        "[╰──](#${colors.base04}) $sudo$character"
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
      package = {
        disabled = true;
      };
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
        style = "bold #${colors.base04}";
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
        not_found_symbol = "[ $int](bold #${colors.base0C})";
        sigint_symbol = "[ $int](bold #${colors.base0C})";
        signal_symbol = "[ $int](bold #${colors.base0C})";
        format = "[$symbol]($style)";
        map_symbol = true;
        recognize_signal_code = true;
      };
      sudo = {
        disabled = false;
        style = "bold #${colors.base0C}";
        symbol = "";
        format = "[$symbol]($style) ";
      };
      git_branch = {
        disabled = false;
        symbol = "";
        style = "bold #${colors.base0E}";
        truncation_length = 15;
        truncation_symbol = "...";
        ignore_branches = [ ];
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
        ahead = "[ $count](#${colors.base0C})";
        diverged = "[ \${ahead_count} /  \${behind_count}](#${colors.base0C}) ";
        behind = "[ $count](#${colors.base0C})";
        up_to_date = "[](#${colors.base0B})";
        untracked = "[](#${colors.base0C}) ";
        stashed = "[](#${colors.base0C}) ";
        modified = "[](#${colors.base0C}) ";
        staged = "[$count](#${colors.base0B}) ";
        renamed = "[󰑕](#${colors.base0C}) ";
        deleted = "[󰆴](#${colors.base0F}) ";
        format = ''[\[ ](#${colors.base04})$all_status$ahead_behind[ \]](#${colors.base04})'';
      };
      git_metrics = {
        disabled = false;
        only_nonzero_diffs = true;
        added_style = "#${colors.base0B}";
        deleted_style = "#${colors.base0F}";
        format = ''[\[ ](#${colors.base04})[$added]($added_style)/[$deleted]($deleted_style)[ \]](#${colors.base04})'';
      };
    };
  };
}
