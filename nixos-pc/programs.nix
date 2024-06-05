{ pkgs, ... }:

{
	programs = {
	  # Hyprland
	  hyprland = {
		enable = true;
		xwayland.enable = true;
		# https://wiki.hyprland.org/0.32.1/Nix/Options-Overrides/#nvidia-patches
	  }; 
  
	  waybar.enable = true;
	  zsh.enable = true;
  
	  # Enable the KDE Connect service
	  kdeconnect = {
		package = pkgs.kdePackages.kdeconnect-kde;
		enable = true;
	  };

	  # Steam
		steam = {
		  enable = true;
		  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		};
	};
}
