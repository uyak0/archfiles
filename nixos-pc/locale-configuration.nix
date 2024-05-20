{ pkgs, ... }:

{
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
}
