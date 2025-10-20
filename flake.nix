{
  description = "Dual-boot NixOS (NVME2) + windows (NVME1) with Microsoft Secure boot keys";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
  };

  outputs = { self, nixpkgs, home-manager, ... };
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hardware/desktop.nix
          ./users/maarten.nix
          ./modules/btrfs-snapper.nix
        ];
      };
    };
}