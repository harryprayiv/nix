{ config, pkgs, ... }:

{
  nixpkgs.config = {
    # Allow unfree, which is required for some drivers.
    allowUnfree = true;
  };
  programs.home-manager.enable = true;

  home = {
    username = "plutusVM";
    homeDirectory = "/home/plutusVM";
    stateVersion = "21.11";
    packages = with pkgs; [ 
      ## Text Editors ##
      alacritty

      ## Web Browsers ##
      brave 
      firefox 
      tor-browser-bundle-bin

      ## Chat Apps ##
      discord 
      #telegram-desktop 
      #signal-desktop
      mumble
  
      ## Security ##
      gnupg keepassx-community
  
      ## Github ##
      mr gitAndTools.gitFull jq

      ## Piracy ##
      openvpn 
      transmission 
      ffmpeg 
      mkvtoolnix
      youtube-dl #Get from unstable

      ## Haskell ##
      cabal-install # terminal app cabal
      ghc # Haskell compiler
    ];
  };

  news.display = "silent";

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultCommand = "fd --type file --follow"; # FZF_DEFAULT_COMMAND
      defaultOptions = [ "--height 20%" ]; # FZF_DEFAULT_OPTS
      fileWidgetCommand = "fd --type file --follow"; # FZF_CTRL_T_COMMAND
    };
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        #Theme
        mskelton.one-dark-theme
        haskell.haskell
      ];
    };
  };
}
