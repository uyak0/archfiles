let
	phpPackages = import (builtins.fetchTarball {
		url = "https://github.com/NixOS/nixpkgs/archive/4426104c8c900fbe048c33a0e6f68a006235ac50.tar.gz";
	}) {};

	php74 = phpPackages.php74;
	php74Extensions = phpPackages.php74Extensions;
in
{
	allowUnfree = true;
	packageOverrides = pkgs: with pkgs; {
		devPackages = pkgs.buildEnv {
			name = "dev-packages";
			paths = [
				php74
				php74Extensions.mbstring


				git
				lazygit
				libgcc
				binutils
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
