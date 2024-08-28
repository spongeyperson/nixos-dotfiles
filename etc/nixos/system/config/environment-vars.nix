# /etc/nixos/system/config/desktop-environment.nix
# Global Environment Variables Config

{
    config,
    lib,
    pkgs,
    ...
}: {
    environment = {
        sessionVariables = {
            # Temporary Solution for Enabling Native Wayland Support for Applications
            NIXOS_OZONE_WL = "1";
        };
        variables = {
            STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
        };
    };

    # Examples can be found on: https://nixos.wiki/wiki/Environment_variables
}