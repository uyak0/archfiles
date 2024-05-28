{ pkgs, ... }:

let 
  unstable = import <nixos-unstable> { config.allowUnfree = true; };  # Adding unstable packages
in
{
  imports = 
  [ 
    ./boot-options.nix
    ./dev-packages.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./home-manager-configuration.nix
    ./locale-configuration.nix
    ./nvidia-configuration.nix
    ./programs.nix
    ./services-configuration.nix

    <home-manager/nixos>
  ];

  # Allow Unfree software
  nixpkgs.config.allowUnfree = true;

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Critical component for Hyprland according to https://nixos.wiki/wiki/Hyprland#Installation
  security.polkit.enable = true;    

  # XDG Portal for Screen Sharing
  xdg.portal.enable = true;

  # Enable zsh
  users.defaultUserShell = pkgs.zsh;

  # Ozone Flags for Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # cursor size
  environment.variables.XCURSOR_SIZE = "32";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";
  time.hardwareClockInLocalTime = true;     # For Dual Booting with Windows

  # Enable sound 
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
    swaynotificationcenter

    linuxKernel.packages.linux_libre.v4l2loopback
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
