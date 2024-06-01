# /etc/nixos/system/config/desktop-environment.nix
# Global Environment Variables Config

{
    config,
    lib,
    pkgs,
    ...
}: {
    environment.variables = {
        STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
    };

    # Examples can be found on: https://nixos.wiki/wiki/Environment_variables
}