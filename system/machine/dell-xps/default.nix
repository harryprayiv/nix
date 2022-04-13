{ config, pkgs, ... }:

{
  imports =  [
    # Hardware scan
    ./hardware-configuration.nix
  ];

  # Use the EFI boot loader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    initrd.kernelModules = [  ];
  };

  networking = {
    hostName = "ada"; # Define your hostname.
    useDHCP = false;
    interfaces.enp0s3.useDHCP = true;
    wireless.enable = false;  # wireless support via wpa_supplicant.
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    #networking.firewall.allowedTCPPorts = [ ... ];
    #networking.firewall.allowedUDPPorts = [ ... ];
    #Or disable the firewall altogether.
    #networking.firewall.enable = false;
  };

  #fileSystems."/data" = {
  #  device = "/dev/nvme0n1p3";
  #  fsType = "ext4";
  #};

  services.xserver = {
    xrandrHeads = [
      { output = "HDMI-1";
        primary = true;
        monitorConfig = ''
          Option "PreferredMode" "3840x2160"
          Option "Position" "0 0"
        '';
      }
      { output = "eDP-1";
        monitorConfig = ''
          Option "PreferredMode" "3840x2160"
          Option "Position" "0 0"
        '';
      }
    ];
    resolutions = [
      { x = 2048; y = 1152; }
      { x = 1920; y = 1080; }
      { x = 2560; y = 1440; }
      { x = 3072; y = 1728; }
      { x = 3840; y = 2160; }
    ];
  };
}
