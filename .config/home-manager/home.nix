{ config, pkgs, ... }:

{
  home.username = "insane";
  home.homeDirectory = "/home/insane";

  #environment.localBinInPath = true;
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    ffmpeg-full
    android-tools
    btop
    cava
    scrcpy
    superfile
    yazi
    localsend
    peazip
    brave
    #firefox-esr
    vscode-fhs
    materialgram
    onlyoffice-desktopeditors
    helix
    obsidian
    pdfslicer
    stow
    xxd
    fluent-icon-theme
    
    #mpv
    #freerdp
    #mate.mate-calc

    # Plasma
    #kdePackages.filelight
    #kdePackages.kclock
    #krita
    #kdePackages.skanlite
    #keepassxc
    qbittorrent
    #kdePackages.krdc
    #catppuccin-kvantum

    # GNOME
    pika-backup
    mission-center
    clapper
    sticky
    baobab
    file-roller
    gnome-clocks
    simple-scan
    gnome-secrets
    #fragments
    bombadillo
    gnome-connections
    warp
    packet
    #bella
    eartag
    gnome-text-editor
    gnome-frog
    collector
    foliate
    recordbox
    dialect
    sly
    parabolic
    gnome-builder
    refine
    rewaita
    sierra-gtk-theme
    fluent-gtk-theme
  ];

  # # Manage Dotfiles Manually
  # home.file = {
  #   "~/.config/git/config".source = null;
  # };

  home.sessionVariables = {
    EDITOR = "gnome-text-editor";
  };
  
  # Decent Cursors
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  # Git
  programs.git = {
    enable = false;
    lfs.enable = true;
  #   userEmail = "hassansohrat@outlook.com";
  #   userName = "Hassan Sohrat";
  };

  # MIME types

  # Shell
  programs = {
    nushell = { enable = true; };  
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  }; 

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
