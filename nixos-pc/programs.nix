{ pkgs, ... }:

{
	programs = {
	  # Hyprland
	  hyprland = {
		enable = true;
		xwayland.enable = true;
		# https://wiki.hyprland.org/0.32.1/Nix/Options-Overrides/#nvidia-patches
		enableNvidiaPatches = true; 
	  }; 
  
	  waybar.enable = true;
	  zsh.enable = true;
  
	  # Enable the KDE Connect service
	  kdeconnect = {
		package = pkgs.libsForQt5.kdeconnect-kde;
		enable = true;
	  };
	};
}
