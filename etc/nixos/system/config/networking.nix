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
        networkmanager = {
            enable = true;
            # Disable Power Saving for Intel iwlwifi module.
            #wifi.powersave = false;
        };
        # Disable Power Saving for Intel iwlwifi module.
        # boot.extraModprobeConfig = ''
        #     options iwlwifi power_save=0
        # '';

        firewall = {
            enable = true;
            #  allowedTCPPorts = [ 47984 47989 47990 48010 ];
            #  allowedUDPPortRanges = [
            #    { from = 47998; to = 48000; }
            #    { from = 8000; to = 8010; }
            #  ];
        };
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