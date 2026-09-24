{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    godot
    libresprite
    krita
  ];
}