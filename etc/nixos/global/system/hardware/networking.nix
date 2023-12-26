{
    config,
    pkgs,
    ...
}:
let
  globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
  systemVariables = globalVars.systemVariables;
  userVariables = globalVars.userVariables;
in
{
    # AMD CPU Enable Microcode Updates.
    # Should be required / enabled by default, but whatever nixos.
    networking = {
        hostName = systemVariables.hostname;
        fqdn = systemVariables.fqdn;

        # Enablement Declarations
        networkmanager.enable = true;
    };
}
