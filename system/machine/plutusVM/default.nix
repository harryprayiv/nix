{ config, pkgs, ... }:

{
  imports =  [
    # Hardware scan
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = "powersave";
  #hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  virtualisation.virtualbox.guest.enable = true;

  networking = {
    hostName = "kombucha"; # Define your hostname.
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
  
  services.xserver = {
    xrandrHeads = [
      { output = "HDMI-1";
        primary = true;
        monitorConfig = ''
          Option "PreferredMode" "1440x1080"
          Option "Position" "0 0"
        '';
      }
      { output = "eDP-1";
        monitorConfig = ''
          Option "PreferredMode" "1440x1080"
          Option "Position" "0 0"
        '';
      }
    ];
    resolutions = [
      { x = 1920; y = 1080; }
      { x = 1440; y = 1080; }
      { x = 720; y = 486; }
    ];
  };
}
