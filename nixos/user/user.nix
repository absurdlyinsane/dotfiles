{ config, lib, pkgs, ... }:

{
    # User configuration
    users.users.insane = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "video" "ustorage" ];
        shell = pkgs.fish;
    };

    programs.fish.enable = true;
    environment.localBinInPath = true;
}
