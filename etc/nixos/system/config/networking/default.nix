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
        # Set Hostname, Use Network Manager:
    networking = {
        hostName = "${commonVariables.hostname}";
        networkmanager.enable = true;
    };
}