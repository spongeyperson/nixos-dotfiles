#TODO: Make more modular with global vars, add description    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; }

{
    config,
    lib,
    pkgs,
    ...
}: {
    virtualisation.vmware.host.enable = true;
    environment.systemPackages = with pkgs; [
        #linuxKernel.packages.linux_zen.vmware
        #vmware-workstation
    ];
}