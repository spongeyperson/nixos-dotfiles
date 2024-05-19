# /etc/nixos/system/config/nixconfig.nix
# NixOS NixPKG Configuration

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
        permittedInsecurePackages = [
            "mailspring-1.12.0" # Mailspring is "Insecure"
            "electron-19.1.9" #Required insecure package for etcher
        ];
    };
    environment.systemPackages = with pkgs; [
        # NixOS Specific Commandline Packages
        nix-diff
        nix-du
        nix-tree
        nix-index
        nix-output-monitor

    ];
}
