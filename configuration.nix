# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
  
{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

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
	nix-config = "sudo -E nvim /etc/nixos/configuration.nix";
	nix-rebuild = "sudo nixos-rebuild switch";
	vi = "nvim";
	vuedev = "cd ~/Projects/e-quiz-web-app/vue-frontend && npm i && npm run dev";
	phpserve = "cd ~/Projects/e-quiz-web-app/laravel-backend && php artisan serve";
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

  # Enabling MariaDB
  services.mysql.package = pkgs.mariadb;
  services.mysql.enable = true;

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Enable zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  services.xserver.displayManager.gdm.wayland = true;  
  
  # Hyprland
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  }; 
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

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	neofetch
	brave
	neovim
	git
	hyprland
	btop
	lazygit
	libgccjit
	libgcc
	binutils
	gcc_multi
	nodePackages_latest.nodejs
	php
	php83Packages.composer
	waybar
	hyprpaper
	unzip
	gnome.adwaita-icon-theme
	clang-tools
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
  system.stateVersion = "23.11"; # Did you read the comment?

}
