{ config, lib, pkgs, ... }:

{
    boot.supportedFilesystems = [ "ntfs" "apfs" "xfs" ];
    users.groups.ustorage = {};
  
    fileSystems."/mount/FastDataVolume" = {
        device = "/dev/disk/by-uuid/dbfc70e4-bbde-42cb-a9df-dc58f3f02a01";
        fsType = "xfs";
        options = [ "rw" "noatime" "nosuid" "nodev" "attr2" "inode64" ];
    };

    fileSystems."/mount/iArchive" = { 
        device = "/dev/disk/by-uuid/04489758489746F8";
        fsType = "ntfs";
        options = [ "rw" "gid=ustorage" "umask=000" "dmask=000" "fmask=000" "windows_names" "nofail" ];
    };

    fileSystems."/mount/PortableDataVolume" = { 
        device = "/dev/disk/by-uuid/34DE5EFDDE5EB738";
        fsType = "ntfs";
        options = [ "rw" "gid=ustorage" "umask=000" "dmask=000" "fmask=000" "windows_names" "nofail" ];
    };
}
