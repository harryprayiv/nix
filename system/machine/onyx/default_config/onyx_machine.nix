{ config, pkgs, ... }:

{
  users = {
    extraUsers = {
      onyx = {
          isNormalUser = true;
          home = "/home/onyx";
          uid = 1000;
          description = "onyx-tower";
          extraGroups = [ "wheel" "plugdev" ];
          # shell = pkgs.zsh;
          # openssh.authorizedKeys.keys = [ "ssh-dss AAAAB3Nza... alice@foobar" ];
        };
      guest = {
          isNormalUser = true;
          home = "/home/guest";
          uid = 2000;
          description = "Guest User";
          extraGroups = [ "networkmanager" ];
          # shell = pkgs.zsh;
      };
    };
    groups.plugdev = {};
  };

  networking = {
    hostName = "kimchi"; # Define your hostname.
    useDHCP = false;
    interfaces.eno1.useDHCP = true;
    interfaces.eth0.useDHCP = true;
    wireless.enable = false;  # wireless support via wpa_supplicant.
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    #networking.firewall.allowedTCPPorts = [ ... ];
    #networking.firewall.allowedUDPPorts = [ ... ];
    #Or disable the firewall altogether.
    #networking.firewall.enable = false;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      xkbVariant = "mac";
      displayManager = {
        gdm.enable = true;
        gdm.wayland = false;
        sddm.enable = false;
      };
      desktopManager = {
        gnome.enable = true;
        plasma5.enable = false;
        xterm.enable = false;
      };
    };
    hardware.bolt.enable = true;
    dbus.packages = [ pkgs.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  
    # Enable CUPS to print documents.
    printing.enable = true;
  
    # Enable the OpenSSH daemon.
    openssh.enable = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  #Virtualbox Stuff
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
