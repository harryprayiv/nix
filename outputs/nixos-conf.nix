{ lib, inputs, system, ... }:

{

  plutusVM = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ../system/machine/plutusVM
      ../system/configuration.nix
    ];
  };

  onyx = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ../system/machine/onyx
      ../system/configuration.nix
    ];
  };

  feather = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ../system/machine/feather
      ../system/configuration.nix
    ];
  };

  dell-xps = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ../system/machine/dell-xps
      ../system/configuration.nix
    ];
  };

  tongfang-amd = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ../system/machine/tongfang-amd
      ../system/configuration.nix
    ];
  };

}
