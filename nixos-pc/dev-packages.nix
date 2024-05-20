{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		git
		lazygit
		libgccjit
		libgcc
		binutils
		gcc_multi
		nodePackages_latest.nodejs
		php
		php83Packages.composer
		clang-tools
		python3
		wget

		# Language Servers
		nil
		lua-language-server
		rust-analyzer
		nodePackages.volar
		typescript
	];
}
