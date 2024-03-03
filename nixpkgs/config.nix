{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
      	nodejs_21
	php
	vscode
	neovim
	git
	php83Packages.composer
      ];
      pathsToLink = [ "/share" "/bin" ];
    };
  };
  allowUnfree = true;
}
