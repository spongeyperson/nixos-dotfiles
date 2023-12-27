# /etc/nixos/global/nix.nix - Configuration of Nix Package Manager itself.

{
  config,
  lib,
  pkgs,
  ...
}: {
    # Global Nix Settings:
    nix = {
        settings.experimental-features = [ "nix-command" "flakes" ];
        settings.auto-optimise-store = true;
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 5d";
        };
        extraOptions = ''
            min-free = ${toString (100 * 1024 * 1024)}
            max-free = ${toString (1024 * 1024 * 1024)}
        '';
    };

    # Nix Package Manager Configuration:
    nixpkgs.config = {
        # Nix Allow Unfree Packages
        allowUnfree = true;

        #Required insecure package for etcher
        #permittedInsecurePackages = [ "electron-12.2.3" ];
    };
}
