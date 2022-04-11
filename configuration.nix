{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./ledger.nix
    ];

  system.stateVersion = "21.11"; # Did you read the comment?

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    binaryCaches = [
      "https://cache.nixos.org/"
      "https://hydra.iohk.io"
    ];
    binaryCachePublicKeys = [
      "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };


  nixpkgs.config = {
    # Allow unfree, which is required for some drivers.
    allowUnfree = true;
  };


  users = {
    users = {
      plutusVM = {
          isNormalUser = true;
          home = "/home/plutusVM";
          uid = 1000;
          description = "plutusVM";
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
    dbus.packages = [ pkgs.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  
    # Enable CUPS to print documents.
    printing.enable = true;
  
    # Enable the OpenSSH daemon.
    openssh.enable = true;
  };

  environment.systemPackages = with pkgs; [ 
  ## Text Editors ##
  alacritty
  ## Github ##
  mr gitAndTools.gitFull jq
  ## Basic Hacker Stuff ##
  gparted nfs-utils sshfs mtr sysstat wget coreutils 
  binutils curl zip unzip killall syncthing-cli asciidoctor 
  appimage-run bind cpulimit file fzf iperf jpegoptim 
  libwebp lm_sensors lsof man mtr nmap ntfs3g openssl 
  pciutils pdftk pandoc pwgen rclone rsync traceroute 
  tree unetbootin unrar unzip usbutils vim which 
  yamllint sudo iptables nmap tcpdump rxvt_unicode 
  filelight gparted parted libreoffice-fresh p7zip remmina 
  zim byobu ncurses oh-my-zsh screen sshpass tmux zsh
  ## Nix Package for nix-shell etc ##
  binutils 
  cabal2nix
  nix
  gnome3.gnome-tweaks
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };
  
    #Virtualbox Stuff
  virtualisation.virtualbox.host.enable = false;
  virtualisation.virtualbox.host.enableExtensionPack = false;
}
