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

  # Enable Docker & VirtualBox support.
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    virtualbox = {
      host = {
        enable = false;
        enableExtensionPack = false;
      };
      guest.enable = false;
    };
  };

  users.extraGroups.vboxusers.members = [ "plutusVM" ];
 
  #fileSystems."/data" = {
  #  device = "/dev/nvme0n1p3";
  #  fsType = "ext4";
  #};

  services.xserver = {
    xrandrHeads = [
      { output = "Virtual1";
        primary = true;
        monitorConfig = ''
          Option "PreferredMode" "800x600"
          Option "Position" "0 0"
        '';
      }
    ];
    resolutions = [
      { x = 800; y = 600; }   
      { x = 2560; y = 1600; }    
      { x = 1920; y = 1440; }     
      { x = 1856; y = 1392; }      
      { x = 1792; y = 1344; }     
      { x = 1920; y = 1200; }      
      { x = 1600; y = 1200; }      
      { x = 1680; y = 1050; }     
      { x = 1400; y = 1050; }      
      { x = 1280; y = 1024; }       
      { x = 1440; y = 900; }       
      { x = 1280; y = 960; }        
      { x = 1360; y = 768; }       
      { x = 1280; y = 800; }        
      { x = 1152; y = 864; }        
      { x = 1280; y = 768; }       
      { x = 1024; y = 768; }        
      { x = 640; y = 480; }       
    ];
  };
}
