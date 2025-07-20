{
  description = "Combined Home Manager and System Manager configuration for nooremf";

  inputs = {
    # Core inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # System Manager
    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NUR - Nix User Repository
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Theming and styling
    catppuccin.url = "github:catppuccin/nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Graphics and hardware support
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-system-graphics = {
      url = "github:soupglasses/nix-system-graphics";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Additional package sets
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    # Hardware configuration (optional)
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flatpak integration
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, system-manager, catppuccin, nixgl, stylix, nix-system-graphics, chaotic, nur, nixos-hardware, lanzaboote, nix-flatpak, zen-browser, ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "nixos";
      username = "nooremf";

      # Define overlays including NUR and nixGL
      overlays = [
        nur.overlays.default
        (final: prev: {
          # Custom package overrides can go here
        })
      ];

      # Import nixpkgs with overlays
      pkgs = import nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };

      # Common special args passed to all configurations
      specialArgs = {
        inherit inputs system hostname username;
        inherit nur;
        flake-inputs = inputs;  # Add this for home.nix compatibility
      };

    in {
      # NixOS system configuration
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = specialArgs;
        modules = [
          # Hardware configuration
          ./hardware-configuration.nix

          # Main system configuration
          ./configuration.nix

          # Enable Flatpak system-wide
          {
            services.flatpak.enable = true;
            xdg.portal.enable = true;
            xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
          }

          # nix-flatpak module
          nix-flatpak.nixosModules.nix-flatpak

          # Home Manager integration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }

          # Catppuccin theme
          catppuccin.nixosModules.catppuccin

          # Stylix theming
          stylix.nixosModules.stylix

          # Chaotic packages
          chaotic.nixosModules.default

          # System-wide overlays
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfree = true;
          })

          lanzaboote.nixosModules.lanzaboote

          ({ pkgs, lib, ... }: {
            environment.systemPackages = [
              pkgs.sbctl
            ];

            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/etc/secureboot";
              configurationLimit = 20;
            };
          })
        ];
      };

      # Standalone Home Manager configuration (for non-NixOS systems)
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          catppuccin.homeManagerModules.catppuccin
          stylix.homeManagerModules.stylix
          chaotic.homeManagerModules.default
          nix-flatpak.homeManagerModules.nix-flatpak  # Add this line

          # Enable overlays in Home Manager
          {
            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfree = true;
          }
        ];
        extraSpecialArgs = specialArgs;
      };

      # System Manager configuration (for non-NixOS systems)
      systemConfigs.default = system-manager.lib.makeSystemConfig {
        modules = [
          nix-system-graphics.systemModules.default

          ({
            config = {
              nixpkgs.hostPlatform = system;
              nixpkgs.overlays = overlays;
              nixpkgs.config.allowUnfree = true;
              system-manager.allowAnyDistro = true;
              system-graphics.enable = true;
            };
          })
        ];
      };
    };
}
