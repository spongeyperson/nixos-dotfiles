# /etc/nixos/system/config/locale.nix
# System Locale Config

{
    config,
    pkgs,
    lib,
    ...
}:
# Import global-vars.nix 
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    # Configure keymap in X11, Internationalisation.
    #services.xserver.xkb.layout = userVariables.keymap;
    #xserver.xkbOptions = "eurosign:e,caps:escape";
    time.timeZone = "${userVariables.timeZone}"; # Set time zone.
    i18n.defaultLocale = "${userVariables.locale}";  # Select internationalisation properties.
}