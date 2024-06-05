{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		git lazygit
		wget

		libgccjit libgcc gcc_multi
		binutils
		nodePackages_latest.nodejs
		php php83Packages.composer
		clang-tools libclang
		python3
		rustup

		# Language Servers
		nil
		lua-language-server
		nodePackages.volar
		typescript
		tailwindcss-language-server
		nodePackages_latest.bash-language-server
	];
}
