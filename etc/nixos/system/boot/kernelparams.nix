# /etc/nixos/system/boot/kernelparams.nix
# Linux Kernel & Parameters Configuration

{
    config,
    lib,
    pkgs,
    ...
}:
# Import global-vars.nix
let
    globalVars = import (toString ../../global-vars.nix) { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    # Kernel Module(s)
    environment.systemPackages = with pkgs; [
        linuxKernel.packages.${systemVariables.kernelmodule_support}.v4l2loopback # Install v4l2loopback
        linuxKernel.packages.${systemVariables.kernelmodule_support}.cpupower # Install cpupower
    ];
    boot = {
        # Set Kernel
        kernelPackages = systemVariables.kernel;

        # Pin kernel version:
        # kernelPackages = let
        #     version = "6.9.5";
        #     suffix = "zen1";
        # in pkgs.linuxPackagesFor (pkgs.linux_zen.override {
        #     inherit version suffix;
        #     modDirVersion = lib.versions.pad 3 "${version}-${suffix}";
        #     src = pkgs.fetchFromGitHub {
        #         owner = "zen-kernel";
        #         repo = "zen-kernel";
        #         rev = "v${version}-${suffix}";
        #         sha256 = "16dm07xd5x5kbn3yk8q2kqwby67953p40ja0akrg31hycz8sgbqq";
        #     };
        # });

        # Parameters added to the kernel command line.
        kernelModules = [ ];

        # The set of kernel modules to be loaded in the second stage of the boot process.
        kernelParams = [
            "snd_intel_dspcfg.dsp_driver=1" # Temporary fix for AMDGPU HDMI Audio (Zen Kernel) - https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3353#note_2017643
        ];
    };
}