{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {

      logo = {
        type = "none";
      };

      display = {
        separator = " ";
      };

      modules = [
        "break"
        {
          type = "title";
          format = "{6}{7}{8}";
        }
        "break"
        {
          key = " OS          ";
          keyColor = "red";
          type = "os";
        }
        {
          key = " Machine     ";
          keyColor = "green";
          type = "host";
        }
        {
          key = " Kernel      ";
          keyColor = "magenta";
          type = "kernel";
        }
        {
          key = "󰅐 Uptime      ";
          keyColor = "red";
          type = "uptime";
        }
        {
          key = "󰑘 Packages    ";
          keyColor = "green";
          type = "packages";
        }
        {
          key = "󰍹 Display     ";
          keyColor = "yellow";
          type = "display";
        }
        {
          key = " WM          ";
          keyColor = "blue";
          type = "wm";
        }
        {
          key = " Shell       ";
          keyColor = "cyan";
          type = "shell";
        }
        {
          key = " Terminal    ";
          keyColor = "red";
          type = "terminal";
        }
        {
          key = " CPU         ";
          keyColor = "yellow";
          type = "cpu";
        }
        {
          key = "󰟽 GPU         ";
          keyColor = "blue";
          type = "gpu";
        }
        {
          key = "󰑭 Memory      ";
          keyColor = "magenta";
          type = "memory";
        }
        {
          key = "󰩟 Local IP    ";
          keyColor = "red";
          type = "localip";
          compact = true;
        }
        "break"
      ];
    };
  };
}
