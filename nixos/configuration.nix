{ config, lib, pkgs, ... }:

let
  customFontConf = pkgs.runCommand "custom-fontconfig-bengali" { } ''
    mkdir -p $out/etc/fonts/conf.d
    cp ${./bengali-fonts.xml} $out/etc/fonts/conf.d/99-bengali.conf
  '';
in

{
  # hardware
  imports =
    [
      ./user/gaming.nix
      ./user/user.nix
      ./AV.nix
      ./GPU.nix
      ./hardware-configuration.nix
      ./network.nix
      ./storage.nix
      ./virtualisation.nix
    ];

  # nix-store
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # non-free
  nixpkgs.config.allowUnfree = true;

  # Boot
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work
      device = "nodev";
    };
  };
  #boot.kernelParams = [ "irqpoll" ];

  # RGB
  services.hardware.openrgb.enable = true;

  # Wireless Networking
  networking.hostName = "insnhstnix";

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Security
  security.rtkit.enable = true;
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = ["insane"];
    keepEnv = true;
    persist = true;
  }];
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 443 ];
  };

  # Language, Locale & Time
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "Asia/Dhaka";
  console.keyMap = "us";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable printing service
  services.printing = { enable = true; drivers = [ pkgs.epson-201401w ]; };

  # System Packages
  environment.systemPackages = with pkgs; [
    home-manager
    micro
    htop
    fastfetch
    tmux
    git
    curl
    wget
    fish
    powershell
    eza
    tree
    ripgrep
    bat
    flatpak
    ffmpeg-full
    onboard
    lshw
    tlp
    opensnitch-ui
    #parted
    gparted
    gptfdisk
    gnome-disk-utility
    file
    pciutils
    qemu-utils
    lsof
    openrgb-with-all-plugins
    s-tui
    ntfs3g
    apfs-fuse
    p7zip
    brave
    xfsprogs
    gvfs
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    google-fonts
  ];

  fonts.fontconfig = {
    enable = true;
    confPackages = [ customFontConf ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11"
  ];

  # AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.fuse
      pkgs.glib
      pkgs.gtk3
      pkgs.fontconfig
      pkgs.freetype
    ];
  };

  # Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
   wantedBy = [ "multi-user.target" ];
   path = [ pkgs.flatpak ];
   script = ''
     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
   '';
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  #system.copySystemConfiguration = true;


  system.stateVersion = "25.05"; # NEVER CHANGE THIS VALUE!!!

}

