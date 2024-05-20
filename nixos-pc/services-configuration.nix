{ pkgs, ...}:

{
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
}
