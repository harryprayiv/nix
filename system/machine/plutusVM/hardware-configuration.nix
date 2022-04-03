{ pkgs, ... }:

{
    fileSystems."/" =
    { device = "/dev/disk/by-uuid/86be1ae9-1579-4445-be92-b881eed0c647";
      fsType = "ext4";
    };

fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/FE8C-EB72";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/5348e4f1-888a-439f-9bbc-e3ddd271087c"; }
    ];

fileSystems."/home/plutusVM/NAS/plutus" =
  { device = "192.168.1.212:/volume2/homes/plutus";
    options = [ "x-systemd.automount" "noauto" ];
    fsType = "nfs";
  };

}