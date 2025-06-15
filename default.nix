{ config, lib, pkgs, ... }:

{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";

    system-manager.allowAnyDistro = true;

    programs.hyprland.enable = true;
    environment = {
      etc = {
        "foo.conf".text = ''
          launch_the_rockets = true
        '';
      };
      systemPackages = with pkgs; [
        ripgrep
        fd
        hello
        zellij
        helix
      ];
    };



    systemd.services = {
      foo = {
        enable = true;
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        wantedBy = [ "system-manager.target" ];
        script = ''
          ${lib.getBin pkgs.hello}/bin/hello
          echo "We launched the rockets!"
        '';
      };
    };
  };
}
