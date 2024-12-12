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
        vmware-workstation #- BROKEN in Latest Update - https://github.com/NixOS/nixpkgs/issues/310121
    ];
    # Possible Patch 2 - Nix Overlay
    (self: super: {
    vmware-workstation = super.vmware-workstation.overrideAttrs (vself: vsuper:
        let
        urlBase = "https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${vself.version}/${vself.build}/linux/";
        file = "VMware-Workstation-${vself.version}-${vself.build}.x86_64.bundle";
        in {
        src = "${self.fetchzip {
            url = urlBase + "core/${file}.tar";
            hash = "sha256-nYkqZ7w3AYdw2YvQNATIYeJpqUwmkLE6jzyQlhGKyEs=";
            stripRoot = false;
        }}/${file}";
        unpackPhase =
            let
            vmware-unpack-env = self.buildFHSEnv {
                name = "vmware-unpack-env";
                targetPkgs = pkgs: [ self.zlib ];
            };
            vmware-tools =
                let
                version = "12.3.5";
                build = "22544099";
                file = system: "vmware-tools-${system}-${version}-${build}.x86_64.component";
                hashes = {
                    linux = "sha256-VHFc2g9Bpz7RaJDTB+MXZ2VKe6YfcM1Y2qcqL75mOgw=";
                    linuxPreGlibc25 = "sha256-ubxS82tyY/biGSBPvPFsggKLYRXUMVJU9dqNfILa7OY=";
                    netware = "sha256-Fs+R4RTgbV+SlFuz7DO/NXdqfMMXf05eSmIfD8AWjvI=";
                    solaris = "sha256-HajtvDG/iPUmi7clO2wkSQRMWsOI/rLFHVDlw/vL4wI=";
                    winPre2k = "sha256-lX4uvJRFSUIzm6cxCCuZwrsgPuRE2Wr1+GYFY0Qk8Tw=";
                    winPreVista = "sha256-xA3UvxIS7u435T0LsyMTCHFUZL9dkTXuekXexOWkXRc=";
                    windows = "sha256-/UrzEQTBhmuQODnNoNPQD4pI4MNCxordb/FxVPS3A9o=";
                };
                srcs = map (system:
                    "${self.fetchzip {
                    url = urlBase + "packages/${file system}.tar";
                    hash = hashes.${system};
                    stripRoot = false;
                    }}/${file system}"
                ) (builtins.attrNames hashes);
                in
                lib.concatMapStringsSep " " (src: "--install-component ${src}") srcs;
            in ''
            ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${vself.src} ${vmware-tools} --extract unpacked"
            '';
        });
    })

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
