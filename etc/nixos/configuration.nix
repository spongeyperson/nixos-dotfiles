# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ 
  config, 
  pkgs,
  lib, 
  ... 
}:
let
  # Global NixOS Variables, (Optional Tunables)
  commonVariables = { 
    hostname = "Spongey-PC"; 
    username = "tyler";
    usershell = "pkgs.fish";

    # DO NOT CHANGE THIS; unless you want a different home dir folder.
    homedir = "/home/${username}";

    # Set System Kernel: (./system/boot/grub/default.nix)
    kernel = "pkgs.linuxPackages_zen";

    # VFIO Settings: (./virtualisation/vfio/default.nix)
    # Use this if you want VFIO.
    # If you don't want VFIO, comment these 2 lines;
    # and comment `./virtualisation` below.
    # OR comment `./vfio` inside `./virtusalisation/default.nix`
    vfioIDs = "10de:2204,10de:1aef";
    vfioBlacklist = "nvidia,nvidiafb,nouveau";
  };
  inherit (lib) mkIf;
in
{
  imports =
    [ # NixOS: Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Custom Includes, with Inheritable "let-in" Variables.
      (import ./hardware (commonVariables // {  }))
      (import ./system (commonVariables // {  }))
      (import ./user (commonVariables // {  }))
      
      # Uncomment this if you want to disable all of the following; vfio, docker, podman
      (import ./virtualisation (commonVariables // {  }))
    ];
  

# Stray Configurations which have yet to be defined elsewhere.
  # Locale
  time.timeZone = "America/Los_Angeles"; # Set time zone.
  i18n.defaultLocale = "en_US.UTF-8";  # Select internationalisation properties.

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # Set Hostname, Use Network Manager:
  networking = {
    hostName = commonVariables.hostname;
    networkmanager.enable = true;
  };

  # XDG Enable Default Portal
  xdg = {
    portal.enable = true;
    portal.xdgOpenUsePortal = true;
  };

  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    cascadia-code
  ];

  # Temporary Solution for Enabling Native Wayland Support for Applications
  # This will be moved *eventually*
  #environment.sessionVariables.NIXOS_OZONE_WL = "1";

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