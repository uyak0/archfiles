{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
	rustup
	jdt-language-server
      	nodejs_21
	php
	neovim
	git
	php83Packages.composer
	ripgrep
	ripgrep-all
	clang
	zulu
	libclang
	opencv
      ];
      pathsToLink = [ "/share" "/bin" ];
    };
  };
}
