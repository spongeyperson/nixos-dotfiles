# Grub Configuration - /system/boot/grub/default.nix

 #TODO: Cleanme
{
  #commonVariables,
  config,
  lib,
  pkgs,
  ...
}: 
# Import global-vars.nix
let
  globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
  commonVariables = globalVars.commonVariables;
in
{
  boot = {
    # Set Kernel
    kernelPackages = commonVariables.kernel;

    # Temporary fix for AMDGPU HDMI Audio (Zen Kernel): 
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3353#note_2017643
    kernelParams = [
      "snd_intel_dspcfg.dsp_driver=1"
    ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
      };
    # Set / Install Grub as Default Bootloader:
      grub = {
          # Enable Grub
          enable = true;
          # EFI Support Enable
          efiSupport = true;
          #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
          device = "nodev";
          #useOSProber = true;
      };
    };
  };
}