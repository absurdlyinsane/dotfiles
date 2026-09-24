{ config, lib, pkgs, ... }:

{
    # Virtualisation
    
        # VMware
        virtualisation.vmware.host.enable = true;

        # VirtualBox
        #virtualisation.virtualbox.host.enable = true;
        #users.extraGroups.vboxusers.members = [ "insane" ];
        #virtualisation.virtualbox.host.enableExtensionPack = true;

        # VirtManager
        #users.groups.libvirtd.members = ["insane"];
        #virtualisation.libvirtd.enable = true;
        #programs.virt-manager.enable = true;
        #virtualisation.spiceUSBRedirection.enable = true;
        #environment.systemPackages = with pkgs; [
        #    virtiofsd
        #];

        # Docker
        #virtualisation.docker.enable = true;
        #virtualisation.docker.rootless = {
        #    enable = true;
        #    setSocketVariable = true;
        #};
        #virtualisation.docker.daemon.settings = {
        #    data-root = "/home/insane/.OtherDrives/DataVolume";
        #};

        # Podman
        #virtualisation = {
        #    containers.enable = true;
        #    podman = {
        #        enable = true;
        #        dockerCompat = true;
        #        defaultNetwork.settings.dns_enabled = true;
        #    };
        #};
        #users.users.insane = {
        #    extraGroups = [
        #        "podman"
        #    ];
        #};
}
