# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

# Global Variables, (Optional Tunables)
  let
    hostname = "Spongey-PC";
    # NOTICE: VFIO has been moved to ./virtualisation/vfio/vfio.nix
  in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Custom Includes
      ./hardware
      ./system
      ./user
      ./virtualisation
    ];
  
  # Set Hostname, Use Network Manager:
  networking = {
	hostName = hostname;
	networkmanager.enable = true;
  };

  # Set time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";



  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    cascadia-code
  ];

  # Temporary Solution for Enabling Native Wayland Support for Applications
  # This will be moved *eventually*
  #environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Virtualisation Toggles, libvirtd, docker, podman
  virtualisation = {
    spiceUSBRedirection.enable = true;
      libvirtd = {
        enable = true;
        qemu.ovmf.enable = true;
        qemu.runAsRoot = true;
        onBoot = "ignore";
        onShutdown = "shutdown";
      };
      docker = {
        enable = true;
        storageDriver = "btrfs";
      };
      podman = {
        enable = true;
        # Enable compat to use podman as a drop-in replacement for docker.
        #dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}