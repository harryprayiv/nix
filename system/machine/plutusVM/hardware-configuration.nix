{ pkgs, ... }:

{
    fileSystems."/" =
    { device = "/dev/disk/by-uuid/4508c421-4cb6-4b60-bcac-3915c18abdad";
      fsType = "ext4";
    };

fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B307-7565";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/23d6c9ef-5721-4e99-81e4-40d68e32e0a8"; }
    ];

fileSystems."/home/plutusVM/NAS/Programming" =
  { device = "192.168.1.212:/volume2/Programming";
    options = [ "x-systemd.automount" "noauto" ];
    fsType = "nfs";
  };

fileSystems."/home/plutusVM/NAS/plutus" =
  { device = "192.168.1.212:/volume2/homes/plutus";
    options = [ "x-systemd.automount" "noauto" ];
    fsType = "nfs";
  };

}
