{
	allowUnfree = true;
	packageOverrides = pkgs: with pkgs; {
		devPackages = pkgs.buildEnv {
			name = "dev-packages";
			paths = [
				git
				lazygit
				libgcc
				binutils
				nodePackages_latest.nodejs
				php
				php83Packages.composer
				clang-tools
				python3
				zulu
				wget
				ripgrep
				rustup
			];
			pathsToLink = [ "/share" "/bin" ];
		};

		# LSP
		lspPackages = pkgs.buildEnv {
			name = "lsp-packages";
			paths = [
				jdt-language-server
				nil
				lua-language-server
				phpactor
				nodePackages_latest.volar
				nodePackages_latest.typescript-language-server
			];
			pathsToLink = [ "/share" "/bin" ];
		};
	};
}
