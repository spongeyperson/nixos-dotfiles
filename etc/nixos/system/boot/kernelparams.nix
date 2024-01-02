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
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    boot = {
        # Set Kernel
        kernelPackages = systemVariables.kernel;

        # Parameters added to the kernel command line.
        kernelModules = [ ];

        # The set of kernel modules to be loaded in the second stage of the boot process.
        kernelParams = [
            "snd_intel_dspcfg.dsp_driver=1" # Temporary fix for AMDGPU HDMI Audio (Zen Kernel) - https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3353#note_2017643
        ];
    };
}