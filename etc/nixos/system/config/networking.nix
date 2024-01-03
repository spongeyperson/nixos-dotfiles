# /etc/nixos/system/config/networking.nix

{
    config,
    pkgs,
    lib,
    ...
}: 
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
        # Set Hostname, Use Network Manager:
    networking = {
        hostName = "${systemVariables.hostname}";
        fqdn = "${systemVariables.fqdn}";
        networkmanager.enable = true;
    };
}