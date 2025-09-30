{ lib, ... }:

let
  settings = {
    default = {
      format = lib.concatStrings [
        "[╭╴](fg:white)"
        "[░▒▓](fg:white)"
        "[   ](bg:white fg:black)"
        "$username"
        "[](bg:blue fg:white)"
        "$directory"
        "[](bg:green fg:blue)"
        "$git_branch"
        "[](bg:brown fg:green)"
        "$git_status"
        "[](fg:brown)"
        "$fill"
        "[](fg:yellow)"
        "$cmd_duration"
        "[](bg:yellow fg:cyan)"
        "$direnv"
        "[](bg:cyan fg:white)"
        "$time"
        "[▓▒░](fg:white)"
        "[╶╮ ](fg:white)"
        "[╰─](fg:white)$character"
      ];

      right_format = lib.concatStrings [ "[─╯](fg:white)" ];

      character = {
        success_symbol = "[󰍟](fg:green)";
        error_symbol = "[󰍟](fg:red)";
      };

      username = {
        show_always = true;
        format = "[$user ](bg:white fg:black)";
        disabled = true;
      };

      directory = {
        style = "bg:blue fg:black";
        format = "[   $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = " ";
        format = "[[ $symbol $branch ](bg:green fg:black)]($style)";
      };

      git_status = {
        style = "bg:git";
        format = "[[($all_status$ahead_behind )](bg:brown fg:black)]($style)";
      };

      cmd_duration = {
        style = "bg:yellow fg:black";
        format = "[ $duration 󰔟 ]($style)";
      };

      direnv = {
        disabled = false;
        symbol = "󱥿 ";
        style = "bg:cyan fg:black";
        format = "[ $symbol$loaded ]($style)";
      };

      time = {
        disabled = false;
        format = "[ $time   ](bg:white fg:black)";
        time_format = "%H:%I";
      };
    };

    pills = {
      format = lib.concatStrings [
        "[╭╴](fg:white)"
        "$username"
        "$directory"
        "$time"
        "($git_branch$git_status)"
        "$direnv"
        "($golang$python)"
        "$conda"
        "$nix_shell"
        "$cmd_duration"
        ''

          [╰─](fg:white)$character''
      ];

      palette = "tokyo-night";
      palettes = {
        "tokyo-night" = {
          blue = "#7AA2F7";
          purple = "#BB9AF7";
          orange = "#FF9E64";
          red = "#F7768E";
          green = "#41A6B5";
          cyan = "#7DCFFF";
          brown = "#CBCCD1";
          gray = "#787C99";
          white = "#D5D6DB";
        };
      };

      username = {
        disabled = false;
        show_always = true;
        format = "[](blue)[ $user](bg:blue fg:black)[](blue)";
      };

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        truncate_to_repo = true;
        style = "bg:purple fg:black";
        format = " [](purple)[  $path]($style)[](purple)";
      };

      time = {
        disabled = true;
        time_format = "%H:%I";
        style = "bg:green fg:black";
        format = " [](green)[  $time]($style)[](green)";
      };

      git_branch = {
        symbol = " ";
        format = " [](orange)[$symbol$branch](bg:orange fg:black)[](orange)";
      };

      git_status = {
        style = "bg:red fg:black";
        format = " [](red)[$all_status$ahead_behind](bg:red fg:black)[](red)";
      };

      cmd_duration = {
        style = "bg:yellow fg:black";
        format = " [](yellow)[󰔟 $duration]($style)[](yellow)";
      };

      direnv = {
        disabled = false;
        symbol = "󱥿 ";
        style = "bg:green fg:black";
        format = " [](green)[$symbol$loaded]($style)[](green)";
      };

      golang = {
        symbol = "󰟓 ";
        style = "bg:cyan fg:black";
        format = " [](cyan)[$symbol($version)]($style)[](cyan)";
      };

      python = {
        symbol = " ";
        style = "bg:cyan fg:black";
        format =
          "${" [](cyan)[\${symbol}\${pyenv_prefix}($version )]($style)[](cyan)"}";
      };

      conda = {
        style = "bg:gray fg:white";
        format = " [](gray)[$symbol$environment]($style)[](gray)";
      };

      nix_shell = {
        disabled = false;
        symbol = " ";
        style = "bg:brown fg:black";
        format = " [](brown)[$symbol$state( ($name))]($style)[](brown)";
      };
    };
  };
in {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = settings.pills // { add_newline = true; };
  };
}
