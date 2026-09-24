{ config, lib, pkgs, ... }:

{
  # GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vulkan-loader
    ];
  };

  # nVidia Prime
  hardware.nvidia.prime = {
    # From "# lshw -c display"
    offload = {
      enable = true;
      enableOffloadCmd = true; # nvidia-offload %command%`
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:6:0:0";
  };

  # Enables OpenGl
  #services.xserver.videoDrivers = ["modesetting"];
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    open = false;
  };
}
