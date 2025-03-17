{
  description = "Gravestam NixOS";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

		nvf.url = "github:notashelf/nvf";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nix-colors,
			nvf,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in
    {
      nixosConfigurations.battlestation = lib.nixosSystem {
        inherit system;
        modules = [ ./system/configuration.nix ];
        specialArgs = {
          inherit pkgs-stable;
        };
      };

      homeConfigurations.master = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ];
        extraSpecialArgs = {
          inherit system;
          inherit nix-colors;
					inherit nvf;
          inherit pkgs-stable;
        };
      };

			devShells.${system}.default = (import ./shell.nix { inherit pkgs; });
    };
}
