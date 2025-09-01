{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    firefox-devedition
    google-chrome
    neovim
    spotify
    uv
    zed

    # utilities
    bat
    eza
    fzf
    fzf-zsh
    gettext
    lazygit
    ncurses
    ripgrep
    zoxide

    # lsp & formatter
    nixd
    nixfmt-rfc-style

    # fonts
    nerd-fonts.agave
    nerd-fonts.jetbrains-mono
  ];
}
