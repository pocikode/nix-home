{ settings, ... }:

{
  programs.git = {
    enable = true;
    ignores = [ "*.swp" ];
    userName = settings.name;
    userEmail = settings.email;
    lfs = {
      enable = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "vim";
        autocrlf = "input";
      };
      pull.rebase = "true";
      rebase.autoStash = "true";
      credential.helper = "cache --timeout=3600";
    };
  };
}
