{
  description = "Flake for epic ownage of Huawei routers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "armv7l-linux" "riscv64-linux" ];

      imports = [ flake-parts.flakeModules.easyOverlay ];

      perSystem = { config, self', pkgs, ... }: {
        packages.balongflash = pkgs.callPackage ./nix/balongflash.nix { };
        packages.balong-usbdload = pkgs.callPackage ./nix/balong-usbdload.nix { };
        checks = config.packages;

        devShells.default = pkgs.mkShell { buildInputs = [ self'.packages.balongflash self'.packages.balong-usbdload pkgs.netcat pkgs.android-tools ]; };
      };

    };
}
