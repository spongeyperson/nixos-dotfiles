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
        # Firewall
        firewall.enable = true;
        # Open ports in the firewall.
        # firewall.allowedTCPPorts = [ ... ];
        # firewall.allowedUDPPorts = [ ... ];
        # networking.firewall.allowedTCPPortRanges = [
        #     { from = 4000; to = 4007; }
        #     { from = 8000; to = 8010; }
        # ];
    };
    # Tailscale
    services = {
        tailscale = {
            enable = true;
            useRoutingFeatures = "client";
        };
    };
    environment = {
        systemPackages = with pkgs; [
            tailscale
        ];
    };
}