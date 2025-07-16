{ config, lib,  pkgs, flake-inputs, nix-flatpak, ... }:

{

  imports = [
   # <catppuccin/modules/home-manager>
   #./themes.nix
   flake-inputs.nix-flatpak.homeManagerModules.nix-flatpak
   ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nooremf";
  home.homeDirectory = "/home/nooremf";


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  services.flatpak = {
    enable = true;

    # Optionally, specify which remotes to use. Flathub is added by default.
    remotes = [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    # List the Flatpak applications you want to install.
    packages = [
      # Example: "org.gnome.Calculator"
      # Add the application IDs of the Flatpaks you want.
      #"org.mozilla.firefox"
      #"com.spotify.Client"
      #"org.videolan.VLC"
      "com.github.zocker_160.SyncThingy"
      # You can also specify the origin if it's not the default (flathub)
      # { appId = "com.example.App"; origin = "my-custom-remote"; }
    ];

    # This option will remove any Flatpak applications you've installed manually
    # that are not listed in the `packages` list above on the next
    # home-manager switch. This helps keep your setup fully declarative.
    #uninstallUnmanaged = true;

    # You can also set overrides for Flatpak applications globally or per-application.
    # For example, to grant an application access to a specific directory:
    overrides = {
      # Global overrides for all flatpaks
      global = {
        Context.filesystems = [
          "xdg-config/Kvantum:ro"
        ];
      };

      # Per-application overrides
      #"org.mozilla.firefox" = {
       # Context.sockets = ["wayland"];
      #};
    };
  };

#   #nixGL.packages = import <nixgl> { inherit pkgs; };
#   nixGL.packages = nixgl.packages;
#   #nixGL.defaultWrapper = "nvidia";
#   #nixGL.defaultWrapper = "mesa";
#   nixGL.defaultWrapper = "nvidia";
#   #nixGL.offloadWrapper = "nvidiaPrime";
#   #nixGL.installScripts = [ "mesa" "nvidiaPrime" ];
#   nixGL.installScripts = [ "nvidia" ];
#   #nixGL.installScripts = ["mesa"];

  programs.git = {
    enable = true;
    userName = "Noor";
    userEmail = "nooremf@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };


      programs.bash = {
    enable = true;
    initExtra = ''
      # Source global definitions
      if [ -f /etc/bashrc ]; then
          . /etc/bashrc
      fi

      # User specific environment
      if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
          PATH="$HOME/.local/bin:$HOME/bin:$PATH"
      fi
      export PATH

      # Uncomment the following line if you don't like systemctl's auto-paging feature:
      # export SYSTEMD_PAGER=

      # User specific aliases and functions
      if [ -d ~/.bashrc.d ]; then
          for rc in ~/.bashrc.d/*; do
              if [ -f "$rc" ]; then
                  . "$rc"
              fi
          done
      fi
      unset rc

      eval "$(starship init bash)"
      eval "$(zoxide init bash)"
    '';

    sessionVariables = {
      EDITOR = "hx";
    };
  };

  programs.fish = {
  enable = true;
  interactiveShellInit = ''
    # Source global definitions (Fish equivalent)
    if test -f /etc/fish/config.fish
        source /etc/fish/config.fish
    end

    # User specific environment - Fish handles PATH differently
    fish_add_path ~/.local/bin
    fish_add_path ~/bin

    # User specific aliases and functions
    if test -d ~/.config/fish/conf.d
        for rc in ~/.config/fish/conf.d/*.fish
            if test -f $rc
                source $rc
            end
        end
    end

    # Initialize starship and zoxide
    starship init fish | source
    zoxide init fish | source
  '';
  shellInit = ''
    # Shell initialization that runs for all fish instances
  '';
  loginShellInit = ''
    # Login shell initialization
  '';
  functions = {
    # You can define custom functions here if needed
  };
  shellAliases = {
    # Define any aliases here
  };
  shellAbbrs = {
    # Fish abbreviations (like aliases but expand when typed)
  };
  plugins = [
    # Fish plugins can be added here
  ];
};

programs.zsh = {
  enable = true;
  initContent = ''
    # Source global definitions
    if [[ -f /etc/zshrc ]]; then
        source /etc/zshrc
    fi

    # User specific environment
    if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
        PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    fi
    export PATH

    # Uncomment the following line if you don't like systemctl's auto-paging feature:
    # export SYSTEMD_PAGER=

    # User specific aliases and functions
    if [[ -d ~/.zshrc.d ]]; then
        for rc in ~/.zshrc.d/*; do
            if [[ -f "$rc" ]]; then
                source "$rc"
            fi
        done
    fi
    unset rc

    # Initialize starship and zoxide
    eval "$(starship init zsh)"
    eval "$(zoxide init zsh)"
  '';
  shellAliases = {
    # Define any aliases here
  };
  history = {
    size = 10000;
    path = "$HOME/.zsh_history";
    ignoreDups = true;
    share = true;
  };
  autosuggestion = {
    enable = true;
  };
  syntaxHighlighting = {
    enable = true;
  };
  oh-my-zsh = {
    # enable = true;
    # plugins = [ "git" "sudo" ];
    # theme = "robbyrussell";
  };
};




     #stylix.enable = true;
     #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
     #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
     #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";



     stylix.fonts = {
        serif = {
          package = pkgs.nerd-fonts.hack;
          name = "Hack Nerd Fonts";
        };

#         noto = {
#           package = pkgs.nerd-fonts.noto;
#           name = "Noto Nerd Fonts";
#         };

        sansSerif = {
          package = pkgs.nerd-fonts.arimo;
          name = "Amiro Nerd fonts";
        };

#         monospace = {
#           package = pkgs.nerd-fonts.mononoki;
#           name = "Mononoki Nerd Fonts";
#         };

          monospace = {
            package = pkgs.nerd-fonts.mononoki;
            name = "Mononoki Nerd Font";
          };


        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    #stylix.fonts = {
    #    serif = {
    #      package = pkgs.nerd-fonts.hack;
    #      name = "Hack Nerd Fonts";
    #    };

#         noto = {
#           package = pkgs.nerd-fonts.noto;
#           name = "Noto Nerd Fonts";
#         };

    #    sansSerif = {
    #      package = pkgs.nerd-fonts.arimo;
    #     name = "Amiro Nerd fonts";
    #    };

    #    monospace = {
    #      package = pkgs.nerd-fonts.mononoki;
    #      name = "Mononoki Nerd Fonts";
    #    };

    #    emoji = {
    #      package = pkgs.noto-fonts-emoji;
    #      name = "Noto Color Emoji";
    #    };
    #  };
#catppuccin.flavor = "mocha";
  #programs.wezterm = {
  #  enable = true;
  #  package = config.lib.nixGL.wrap pkgs.wezterm;
  #};

 # catppuccin.enable = true;

  #programs.zellij.enable = true;
  #programs.yazi.enable = true;

  programs = {
    wezterm = {
        enable = true;
        package = pkgs.wezterm;
        extraConfig = builtins.readFile /home/nooremf/wezterm-config-master/wezterm.lua;

     };

    ghostty = {
      enable = true;
      package = pkgs.ghostty;
    };

    kitty = {
      enable = true;
      package = pkgs.kitty;
    };

    alacritty = {
      enable = true;
      package = pkgs.alacritty;
    };

    foot = {
      enable = true;
      package = pkgs.foot;
    };

      zellij = {
        enable = true;
        package = pkgs.zellij;

     };

     yazi = {
        enable = true;
        package = pkgs.yazi;
        settings = {
            manager = {
              ratio = [
                         1
                         4
                         3
              ];
              sort_by = "natural";
              sort_sensitive = true;
              sort_reverse = false;
              sort_dir_first = true;
              linemode = "none";
              show_hidden = true;
              show_symlink = true;
           };

           opener = {
    text = [
      { run = "helix \"$@\""; block = true; }
    ];
  };

        media = [
        {
          run = "mpv \"$@\"";
          desc = "mpv";
          block = true;
        }
      ];

     pdff = [
        { run = "okular \"$@\""; desc = "Okular"; block = true; for = "unix"; }
      ];
           open = {
              # rules = [
             #{mime = ".pdf"; use = [ "pdff" ];}
             #];
           };
      preview = {
         image_filter = "lanczos3";
         image_quality = 90;
         tab_size = 1;
         max_width = 600;
         max_height = 900;
         cache_dir = "";
         ueberzug_scale = 1;
         ueberzug_offset = [
                             0
                             0
                             0
                             0
                           ];
         };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
        };
      };

     };

    rio = {
        enable = true;
        package = pkgs.rio;

     };

    helix = {
      enable = true;
      package = pkgs.helix;
    };


    btop = {
      enable = true;
      package = pkgs.btop;
    };
  };
  #catppuccin.zellij.enable = true;
  #catppuccin.zellij.flavor = "mocha";
/*
  catppuccin = {
      zellij = {
          enable = true;
          flavor = "mocha";
      };

      yazi = {
          enable = true;
          flavor = "mocha";
      };

       rio = {
          enable = true;
          flavor = "mocha";
      };


  };*/


  #catppuccin.flavor = "mocha";
  #catppuccin.enable = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

     #oh-my-posh
     #guix
     #ladybird
     #servo
     #ptyxis
     #blackbox-terminal
     #cosmic-term
     #konsole
     #ghostty
     #rioterm
     zoxide
     #peazip
     jq
     poppler
     fd
     ripgrep
     fzf
     imagemagick
     xsel
     #(config.lib.nixGL.wrap helix)
     rio
     #zathura
     fcitx5-openbangla-keyboard
     nerd-fonts.mononoki
     nerd-fonts.arimo
     nerd-fonts.hack
     noto-fonts-emoji
     localsend
    ];
#  ]++ (builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts));;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    #".config/wezterm/wezterm.lua".source = /home/nooremf/wezterm-config-master/wezterm.lua;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nooremf/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
