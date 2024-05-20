{ pkgs, ...}:

{
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
}
