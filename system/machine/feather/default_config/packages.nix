{ pkgs, ... }:

{ environment.systemPackages = with pkgs; [ 
  ## Text Editors ##
  vscode atom
  terminator
  #konsole alacritty

  ## Web Browsers ##
  brave tor-browser-bundle-bin

  ## Chat Apps ##
  discord #telegram-desktop signal-desktop
  mumble #hexchat teamspeak_client thunderbird
  
  ## RSAT ##
  #ansible teamviewer
  # anydesk
  
  ## Security ##
  gnupg keepassxc

  ## Crypto ##
  ledger-live-desktop
  
  ## Github ##
  mr gitAndTools.gitFull jq

  ## Basic Hacker Stuff ##
  gparted nfs-utils sshfs mtr sysstat
  wget coreutils binutils curl
  zip unzip killall syncthing-cli
  htop
  asciidoctor appimage-run bind cpulimit file fzf iperf jpegoptim libwebp lm_sensors
  lsof man mtr nmap ntfs3g openssl pciutils pdftk pandoc pwgen rclone rsync traceroute
  tree unetbootin unrar unzip usbutils vim which yamllint
  vimHugeX sudo iptables nmap tcpdump rxvt_unicode
  filelight libreoffice-fresh p7zip remmina zim
  byobu ncurses screen sshpass tmux
  #zsh oh-my-zsh
  
  ## Cloud ##
  #awscli google-cloud-sdk heroku kops kubectl minikube
  
  ## Gaming ##
  # pcsxr steam dolphinEmu

  ## Coding ##
  gcc zlib bc man-pages
  zulu #OpenJDK 11
  #android-studio gnumake jekyll
  #jupyter visidata
  
  # Networking
  #networkmanager networkmanager-openvpn networkmanager-vpnc

  ## Piracy ##
  openvpn transmission vlc ffmpeg mkvtoolnix
  #unstable.youtube-dl #Get from unstable
  #abcde audacity brasero cdparanoia devede gimp
  #inkscape mpv pavucontrol pulseeffects

  ## Nix Package for nix-shell etc ##
  binutils 
  cabal2nix
  nix
  
  ## X11 Packages ##
  trayer

  ## Haskell ##
  cabal-install # terminal app cabal
  ghc # Haskell compiler

  # Gnome
  gnome3.gnome-tweaks
  ];
}
