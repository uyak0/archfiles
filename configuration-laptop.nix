{ config, pkgs, ... }:
  
let
  unstable = import <unstable> { config.allowUnfree = true; };
in 
{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  # Fonts 
  fonts = {
    packages = with pkgs; [
      # Nerd Fonts
      (nerdfonts.override { fonts = [
	"FiraCode"
	"JetBrainsMono"
      ]; })

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
  };

  i18n = {
    # Select internationalisation properties.
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "ms_MY.UTF-8";
      LC_IDENTIFICATION = "ms_MY.UTF-8";
      LC_MEASUREMENT = "ms_MY.UTF-8";
      LC_MONETARY = "ms_MY.UTF-8";
      LC_NAME = "ms_MY.UTF-8";
      LC_NUMERIC = "ms_MY.UTF-8";
      LC_PAPER = "ms_MY.UTF-8";
      LC_TELEPHONE = "ms_MY.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
	fcitx5-chinese-addons
	fcitx5-rime
	fcitx5-gtk
      ];
    };
  };

  programs = {
    # Hyprland
    hyprland = {
      enable = true;
      xwayland.enable = true;
      # https://wiki.hyprland.org/0.32.1/Nix/Options-Overrides/#nvidia-patches
      enableNvidiaPatches = true; 
    }; 
    # Waybar
    waybar.enable = true;

    # Enable zsh
    zsh.enable = true;
  };

  # Home Manager
  home-manager.users.uyako= {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.11";

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
	enable = true;
	theme = "wedisagree";
	plugins = [
	  "git"
	  "zoxide"
	];
      };

      shellAliases = {
	nixconf = "sudo -E nvim /etc/nixos/configuration.nix";
	nixbuild = "sudo nixos-rebuild switch";
	nixsync = "cp /etc/nixos/configuration.nix ~/dotfiles/configuration-laptop.nix";
	nix-upgrade = "sudo nixos-rebuild switch --upgrade";
	vi = "nvim";
	ls = "eza";
	lg = "lazygit";
      };
    };

    programs.git = {
      enable = true;
      userName  = "uyak0";
      userEmail = "milkycoffeethings@gmail.com";
    };

    home.pointerCursor ={
      name = "Adwaita";
      gtk.enable = true;
      size = 32;
      package = pkgs.gnome.adwaita-icon-theme;
    };

    home.packages = with pkgs; [
      zoxide
      zsh-you-should-use
      eza
    ];
  };

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Electron flags
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # cursor size
  environment.variables.XCURSOR_SIZE = "32";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. 
  users = {
    users.uyako = {
      isNormalUser = true;
      description = "bryn";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    # Set zsh as default shell
    defaultUserShell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Hyprland Essentials
    hyprpaper
    gnome.adwaita-icon-theme

    # Apps
    firefox-devedition
    unstable.obsidian
    discord
    brave
    spotify
    kitty

    # Development
    git
    lazygit
    libgccjit
    libgcc
    binutils
    gcc_multi
    nodePackages_latest.nodejs
    php
    php83Packages.composer
    clang-tools
    python3
    wget
    zulu
    mpi

    # Editors
    vim 
    neovim

    # Utilities
    unstable.xwaylandvideobridge
    neofetch
    btop
    unzip
    grim
    slurp
    wl-clipboard
    playerctl
    pavucontrol
    rofi
    ripgrep


    # Language Servers
    jdt-language-server
  ];

  # List of services
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Configure keymap in X11
      layout = "us";
      xkbVariant = "";

      # Load nvidia driver for Xorg and Wayland
      videoDrivers = ["nvidia"];

      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;  

      # Enable the GNOME Desktop Environment.
      desktopManager.gnome.enable = true;
    };

    # Enabling MariaDB
    mysql.package = pkgs.mariadb;
    mysql.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

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
  system.stateVersion = "23.11"; # Did you read the comment?

}
