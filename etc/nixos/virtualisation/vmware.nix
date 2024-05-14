# /etc/nixos/virtualisation/vmware.nix
# VMWare Configuration

#TODO: Make more modular with global vars, add description    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; }

{
    config,
    lib,
    pkgs,
    ...
}: {
    virtualisation.vmware.host.enable = true;
    environment.systemPackages = with pkgs; [
        linuxKernel.packages.linux_zen.vmware
        #vmware-workstation - BROKEN in Latest Update - https://github.com/NixOS/nixpkgs/issues/310121
    ];
    # Possible Patch (Unimplemented)
    #https://discourse.nixos.org/t/how-to-install-a-package-that-was-manually-downloaded/45132/12
    #virtualisation.vmware.host.enable = true;
        #virtualisation.vmware.host.package = (pkgs.vmware-workstation.overrideAttrs {
    # src = ./vmware.bundle;
    #     unpackPhase = let
    #         vmware-unpack-env = pkgs.buildFHSEnv rec {
    #             name = "vmware-unpack-env";
    #             targetPkgs = pkgs: [ pkgs.zlib ];
    #         };
    #     in ''
    #         ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${src} --extract unpacked"
    #         # If you need it, copy the enableMacOSGuests stuff here as well.
    #     '';
    # });
}