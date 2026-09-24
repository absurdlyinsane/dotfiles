{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    protonup-ng
    lutris
    heroic
    protonup-qt
    opengamepadui
    openttd-jgrpp
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
  };
}
