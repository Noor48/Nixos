{
  description = "Combined Home Manager and System Manager configuration for nooremf";

  inputs = {
    # Core inputs
#     nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";

    # Hardware configuration (optional)
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";  # Remove the version pin
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, system-manager, catppuccin, nixgl, stylix, nix-system-graphics, chaotic, nur, nixos-hardware, lanzaboote,  ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "nixos";
      username = "nooremf";

      # Define overlays including NUR and nixGL
      overlays = [
        #nixgl.overlay
        nur.overlays.default
        # Add custom overlays here if needed
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
        #inherit nixgl nur;
        inherit nur;
      };

    in {
      # NixOS system configuration
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = specialArgs;
        modules = [
          # Hardware configuration (you'll need to create this)
          ./hardware-configuration.nix

          # Main system configuration
          ./configuration.nix

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

          # Hardware support (optional, uncomment if needed)
          # nixos-hardware.nixosModules.common-pc-ssd
          # nixos-hardware.nixosModules.common-cpu-intel
          # nixos-hardware.nixosModules.common-gpu-nvidia

          # System-wide overlays
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfree = true;
          })

          lanzaboote.nixosModules.lanzaboote

#           ({ pkgs, lib, ... }: {
#
#             environment.systemPackages = [
#               # For debugging and troubleshooting Secure Boot.
#               pkgs.sbctl
#             ];
#
#             # Lanzaboote currently replaces the systemd-boot module.
#             # This setting is usually set to true in configuration.nix
#             # generated at installation time. So we force it to false
#             # for now.
#             boot.loader.systemd-boot.enable = lib.mkForce false;
#
#             boot.lanzaboote = {
#               enable = true;
#               pkiBundle = "/var/lib/sbctl";
#             };
#           })

            ({ pkgs, lib, ... }: {
                environment.systemPackages = [
                  # For debugging and troubleshooting Secure Boot.
                  pkgs.sbctl
                ];

                # Lanzaboote currently replaces the systemd-boot module.
                # This setting is usually set to true in configuration.nix
                # generated at installation time. So we force it to false
                # for now.
                boot.loader.systemd-boot.enable = lib.mkForce false;

                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/etc/secureboot";  # Changed from /var/lib/sbctl
                  configurationLimit = 20;       # Added: Keep 20 generations
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

          # Add your system manager modules here
          # ./system-manager.nix
        ];
      };

#       # Development shells
#       devShells.${system}.default = pkgs.mkShell {
#         buildInputs = with pkgs; [
#           nixos-rebuild
#           home-manager
#           git
#           vim
#         ];
#         shellHook = ''
#           echo "NixOS development environment loaded!"
#           echo "Available commands:"
#           echo "  sudo nixos-rebuild switch --flake .#${hostname}"
#           echo "  home-manager switch --flake .#${username}"
#           echo "  system-manager switch --flake .#default"
#         '';
#       };

#       # Formatter for nix files
#       formatter.${system} = pkgs.nixpkgs-fmt;
#
#       # Custom packages (if you want to define any)
#       packages.${system} = {
#         # Add custom packages here
#       };
#
#       # Apps for easy flake usage
#       apps.${system} = {
#         rebuild-system = {
#           type = "app";
#           program = toString (pkgs.writeShellScript "rebuild-system" ''
#             sudo nixos-rebuild switch --flake .#${hostname} "$@"
#           '');
#         };
#
#         rebuild-home = {
#           type = "app";
#           program = toString (pkgs.writeShellScript "rebuild-home" ''
#             home-manager switch --flake .#${username} "$@"
#           '');
#         };
#
#         rebuild-system-manager = {
#           type = "app";
#           program = toString (pkgs.writeShellScript "rebuild-system-manager" ''
#             system-manager switch --flake .#default "$@"
#           '');
#         };
#       };
    };
}
