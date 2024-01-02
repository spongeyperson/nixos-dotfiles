# /etc/nixos/tunables/hardware-specific/gpu.nix

{
    pkgs,
    user,
    ...
}:
let
    # Define Global Variables from (/etc/nixos/tunables/global-vars.nix)
    globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
    # Simplify Global Variables
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    hardware.logitech.wireless = {
        enable = true;
        enableGraphical = true;
    };
    environment = {
        systemPackages = with pkgs; [
            # Work Around for Logitech Mice
            logitech-udev-rules
            solaar

            # Ratbag Control
            libratbag
            piper
        ];
    };
}
