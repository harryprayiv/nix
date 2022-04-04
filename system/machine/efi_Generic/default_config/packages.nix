{ pkgs, ... }:

{ environment.systemPackages = with pkgs; [ 
  ## Text Editors ##
  alacritty vscode atom

  ## Web Browsers ##
  brave firefox

  ## Chat Apps ##
  discord #telegram-desktop signal-desktop

  ## Github ##
  mr gitAndTools.gitFull jq

  ## Basic Hacker Stuff ##
  gparted nfs-utils sshfs mtr sysstat
  wget coreutils binutils curl
  zip unzip killall syncthing-cli
  htop
  vimHugeX sudo iptables nmap tcpdump rxvt_unicode xscreensaver

  ## Coding ##
  gcc zlib bc manpages
  zulu #OpenJDK 11

  ## Piracy ##
  openvpn transmission vlc ffmpeg mkvtoolnix

  ## Nix Package for nix-shell etc ##
  binutils 
  cabal2nix
  
  ## X11 Packages ##
  trayer

  ## Haskell packages and Xmonad Stuff ##
  cabal-install 
  ghc 
  ];
}
