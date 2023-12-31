{
    config,
    pkgs,
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
    # AMD CPU Enable Microcode Updates.
    # Should be required / enabled by default, but whatever nixos.
    networking = {
        # Enable Network Manager
        networkmanager.enable = true;

        # Set Hostname & FQDN
        hostName = systemVariables.hostname;
        fqdn = systemVariables.fqdn;
    };
}
