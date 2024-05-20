{ config, lib, pkgs, ... }:

# Adding unstable packages
let 
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
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

    # Enable the KDE Connect service
    kdeconnect = {
      package = pkgs.libsForQt5.kdeconnect-kde;
      enable = true;
    };
  };

  # Critical component for Hyprland according to https://nixos.wiki/wiki/Hyprland#Installation
  security.polkit.enable = true;    

  # XDG Portal for Screen Sharing
  xdg.portal.enable = true;

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
	theme = "neo";
	plugins = [
	  "git"
	  "zoxide"
	];
	custom = "$HOME/.config/zsh";
      };

      shellAliases = {
	nixconf = "sudo -E nvim /etc/nixos/configuration.nix";
	nixbuild = "sudo nixos-rebuild switch";
	vi = "nvim";
	ls = "eza";
	lg = "lazygit";
	hyprconf = "nvim ~/.config/hypr/hyprland.conf";
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

  # Enable zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Ozone Flags for Wayland
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

  # Enable sound 
  sound.enable = true;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.uyako = {
    isNormalUser = true;
    description = "bryn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Hyprland Essentials
    hyprpaper
    gnome.adwaita-icon-theme

    # Apps
    unstable.obsidian
    discord
    brave
    spotify
    droidcam
    kitty
    variety

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
    swaynotificationcenter

    linuxKernel.packages.linux_libre.v4l2loopback
  ];

  # Virtual Camera 
  boot.extraModulePackages = with config.boot.kernelPackages;
  [ v4l2loopback.out ];
  boot.kernelModules = [
    "v4l2loopback"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

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

  # Hardware Configs
  hardware = {
    # Disable PulseAudio in favor of WirePlumber
    pulseaudio.enable = false;

    # Settings for Nvidia
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {

      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
	version = "525.116.04";
	sha256_64bit = "sha256-hhDsgkR8/3LLXxizZX7ppjSlFRZiuK2QHrgfTE+2F/4=";
	sha256_aarch64 = "sha256-k7k22z5PYZdBVfuYXVcl9SFUMqZmK4qyxoRwlYyRdgU=";
	openSha256 = "sha256-dktHCoESqoNfu5M73aY5MQGROlZawZwzBqs3RkOyfoQ=";
	settingsSha256 = "sha256-qNjfsT9NGV151EHnG4fgBonVFSKc4yFEVomtXg9uYD4=";
	persistencedSha256 = "sha256-ci86XGlno6DbHw6rkVSzBpopaapfJvk0+lHcR4LDq50=";

	ibtSupport = true;
      };  
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
