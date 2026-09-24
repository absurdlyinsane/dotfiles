{ config, lib, pkgs, ... }:

{
  # Session Manager
  #services.greetd.enable = true;
  services.displayManager.ly.enable = true;


  # Audio
  services.pulseaudio.enable = false;
  services.pulseaudio.support32Bit = false;
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;

  # Display
  services.xserver.enable = true;
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.libinput.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = false;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  #environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #  discover
  #];

  environment.systemPackages = with pkgs; [
    waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    mako
    libnotify
    swww
    alacritty
    wofi
    grim
    slurp
    wf-recorder
    xfce.thunar
    superfile
    yazi
    networkmanagerapplet
    hyprlock
    hypridle
    hyprpolkitagent
    hyprpanel
    ocs-url
    nwg-look
    peazip
	libsForQt5.qtstyleplugin-kvantum
	libsForQt5.qt5ct
	kdePackages.qt6ct
  ];

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
