{ pkgs, ... }:

{
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
	custom = "$HOME/.config/zsh"; # Specifies custom directory 
	theme = "neo";		      # For the theme
	plugins = [
	  "git"
	  "zoxide"
	];
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
}
