# System Locale Config - /system/config/locale/default.nix

{
    config,
    pkgs,
    lib,
    ...
}: 
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    commonVariables = globalVars.commonVariables;
in
{
    time.timeZone = "${commonVariables.timeZone}"; # Set time zone.
    i18n.defaultLocale = "${commonVariables.Locale}";  # Select internationalisation properties.
}