# /etc/nixos/system/config/networking.nix

{
    config,
    pkgs,
    lib,
    ...
}: 
let
    globalVars = import (toString ../../global-vars.nix) { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
        # Set Hostname, Use Network Manager:
    networking = {
        hostName = "${systemVariables.hostname}";
        fqdn = "${systemVariables.fqdn}";
        networkmanager.enable = true;
        firewall = {
            enable = true;
            #  allowedTCPPorts = [ 47984 47989 47990 48010 ];
            #  allowedUDPPortRanges = [
            #    { from = 47998; to = 48000; }
            #    { from = 8000; to = 8010; }
            #  ];
        };
    };
}