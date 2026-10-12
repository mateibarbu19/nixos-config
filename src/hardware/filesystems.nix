{ vars, ... }: {

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/LinuxRoot";
    fsType = "ext4";
  };

  fileSystems."/media/${vars.mainUsername}/Data" = {
    device = "/dev/disk/by-label/Data";
    fsType = "ext4";
    options = [
      "user"
      "defaults"
      "X-mount.owner=${vars.mainUsername}"
      "X-mount.group=users"
    ];
  };

  fileSystems."/mnt/my-ramdisk" = {
    device = "none";
    fsType = "tmpfs";
    options = [
      "user"
      "defaults"
      "X-mount.owner=${vars.mainUsername}"
      "X-mount.group=users"
      "size=100M"
    ];
  };

  # Don't bloat disk with tmp files
  boot.tmp.cleanOnBoot = true;
}
