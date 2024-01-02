# /etc/nixos/system/boot/grub.nix
# Grub Configuration

{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
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