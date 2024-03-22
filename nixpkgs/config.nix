{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
      	nodejs_21
	php
	neovim
	git
	php83Packages.composer
	ripgrep
	ripgrep-all
      ];
      pathsToLink = [ "/share" "/bin" ];
    };
  };
}
