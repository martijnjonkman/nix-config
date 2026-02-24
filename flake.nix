{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    eve-preview-manager.url = "https://flakehub.com/f/h0lylag/EVE-Preview-Manager/*";
  };

  outputs = { self, nixpkgs, eve-preview-manager, ...  }:
  let
    system = "x86_64-linux";

    overlay = final: prev: {
      eve-preview-manager =
        eve-preview-manager.packages.${system}.default;
    };
  in {
    nixosConfigurations.nixos-btw = 
      nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          {
            nixpkgs = {
              config.allowUnfree = true;
              overlays = [ overlay ];
            };
          }
          
          ./hosts/nixos-btw
        ];
      };
  };
}
