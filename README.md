nix-config
==========

[![CI Home](https://github.com/harryprayiv/nix/workflows/Home/badge.svg)](https://github.com/harryprayiv/nix/actions)
[![CI System](https://github.com/harryprayiv/nix/workflows/NixOS/badge.svg)](https://github.com/harryprayiv/nix/actions)

My current fork of the Gvolpe's NixOS configuration files, home-manager, neovim, etc for use with creating my own configuration from his amazing one.

![scala-dev-env](imgs/scala-dev.png)

![desktop](imgs/desktop-1.jpg)

![amd](imgs/amd.jpg)

![themes](imgs/theme.jpg)

## Programs

The `home.nix` file contains details about all the software OP uses, but here's a shout-out to the ones gvolpe uses the most and that are customized to my needs.

| Type           | Program      |
| :------------- | :----------: |
| Editor         | [NeoVim](https://neovim.io/) |
| Launcher       | [Rofi](https://github.com/davatorium/rofi) |
| Shell          | [Fish](https://fishshell.com/) |
| Status Bar     | [Polybar](https://polybar.github.io/) |
| Terminal       | [Alacritty](https://github.com/alacritty/alacritty) |
| Window Manager | [XMonad](https://xmonad.org/) |

If you're interested in using `taffybar` or `xmobar`, browse the commit history and you will find the configuration files gvolpe used. Here's a [screenshot](imgs/taffybar.png) showcasing the former.

## Themes

| Type           | Name      |
| :------------- | :----------: |
| GTK Theme      | [Juno Ocean](https://github.com/EliverLara/Juno) |
| GTK Icon Theme | [Beauty Line](https://www.gnome-look.org/p/1425426/) |
| Terminal Font  | [JetBrainsMono](https://www.jetbrains.com/lp/mono/) |

## Structure

Here is an overview of the folders' structure:

```
.
├── build
├── flake.nix
├── flake.lock
├── home
│  ├── config.nix
│  ├── display
│  ├── home.nix
│  ├── overlays
│  ├── programs
│  ├── scripts
│  ├── secrets
│  ├── services
│  └── themes
├── imgs
├── notes
├── outputs
│  ├── home-conf.nix
│  ├── installation.nix
│  └── nixos-conf.nix
└── system
   ├── cachix
   ├── cachix.nix
   ├── configuration.nix
   ├── fonts
   ├── machine
   ├── misc
   └── wm
```

- `build`: the build and installation script.
- `flake.nix`: home and system configurations.
- `home`: all the user programs, services and dotfiles.
- `imgs`: screenshots and other images.
- `notes`: cheat-sheets, docs, etc.
- `outputs`: the Home Manager, installation shell and NixOS flake outputs.
- `system`: the NixOS configuration, settings for different laptops and window managers.

## Install

You can have a look at the available flake outputs before getting started.

```console
$ nix flake show github:harryprayiv/nix
github:harryprayiv/nix/60b91aea6461cfb8fb1efdc9fb88f8c5ba815810
├───devShell
│   └───x86_64-linux: development environment 'installation-shell'
├───homeConfigurations: unknown
└───nixosConfigurations
    ├───plutusVM: NixOS configuration
    ├───dell-xps: NixOS configuration
    └───tongfang-amd: NixOS configuration
```

### NixOS

The full home configuration is not yet fully automated but the NixOS configuration can be installed by running the following command.

```console
$ nixos-rebuild switch --flake github:harryprayiv/nix#plutusVM
```

Beware that the `hardware-configuration.nix` file is the result of the hardware scan of the specific machine and might not be suitable for yours.

### Home Manager

A fresh install requires the creation of certain directories so this has not been automated yet (see `build` script file). However, if you omit those steps, the entire HM configuration can also be built as any other flake.

```console
$ nix build github:harryprayiv/nix#homeConfigurations.plutusVM-vm.activationPackage
$ result/activate
```

### Full configuration via script

On a fresh NixOS installation, run the following commands.

```console
$ nix flake clone github:harryprayiv/nix --dest /choose/a/path
$ nix run nixpkgs#git-crypt unlock
$ ./build fresh-install # requires sudo
```

> Note that `git-crypt unlock` requires your GPG Keys to be correctly set up.

The `build` script is only suitable for a fresh install customized to my personal use but you can build the flakes directly. E.g.

```console
$ nix build .#nixosConfigurations.plutusVM.config.system.build.toplevel
sudo result/bin/switch-to-configuration switch
```

Or for Home Manager.

```console
$ nix build .#homeConfigurations.plutusVM-vm.activationPackage
$ result/activate
```
