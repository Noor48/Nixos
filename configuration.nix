# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./lanzaboote.nix
      #./nvidia.nix
      ./themes.nix
    ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages;

  boot.kernel.sysctl = {
    "kernel.unprivileged_userns_clone" = 1;
    # Optional: Set limits on user namespaces
    "user.max_user_namespaces" = 65536;
  };

  # Optional: If you're using AppImages frequently
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Optional: Enable container support if needed
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      # Podman also benefits from user namespaces
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;
  backupFileExtension = "backup";
  users.nooremf = {
    home.stateVersion = "24.11";
    # your user-specific home-manager config
      };
    };

    # Enable Chaotic Nyx cache for faster downloads
  chaotic.nyx.cache.enable = true;

  # Enable Mesa Git packages
  chaotic.mesa-git.enable = true;

  # Specify additional Mesa packages (optional)
  chaotic.mesa-git.extraPackages = with pkgs; [
    # Add specific Mesa packages you need, e.g.:
    # mesa.drivers
    # vulkan-loader
  ];

  # 32-bit Mesa packages for compatibility (optional)
  chaotic.mesa-git.extraPackages32 = with pkgs.pkgsi686Linux; [
    # Add 32-bit Mesa packages if needed for gaming/compatibility
  ];

  # Create fallback specialisation (optional)
  chaotic.mesa-git.fallbackSpecialisation = true;

  # Replace base Mesa package system-wide (use with caution)
  #chaotic.mesa-git.replaceBasePackage = true;


  #home-manager.backupFileExtension = "backup";


  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  programs.fish.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.flatpak.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nooremf = {
    isNormalUser = true;
    description = "Noor E Mustafa Ferdous";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };




  stylix.enable = true;

#   fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts)
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  programs.gpu-screen-recorder = {
    enable = true;
    # NVIDIA patch is automatically applied when using Chaotic Nyx
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    niv
    sbctl
    kdePackages.sddm-kcm
    keepassxc
    efivar
    #cat
    file
    starship
    zoxide
    vlc
    mpv
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
