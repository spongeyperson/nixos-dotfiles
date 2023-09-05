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
  globalVars = import ./global-vars.nix { inherit config pkgs lib; };
  commonVariables = globalVars.commonVariables;
in
{
  imports =
    [ # NixOS: Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Custom Includes
      ./hardware
      ./system
      ./user
      ./virtualisation

      # TODO: Cleanup All imports on all configs.
      #(import ./hardware/default.nix { commonVariables = commonVariables; })
      #(import ./system/default.nix { commonVariables = commonVariables; })
      #(import ./user/default.nix { commonVariables = commonVariables; })
      
      # Uncomment this if you want to disable all of the following; vfio, docker, podman
      #(import ./virtualisation/default.nix { commonVariables = commonVariables; })
    ];
  

## Stray Configurations which have yet to be defined elsewhere.
  # Locale
  time.timeZone = "America/Los_Angeles"; # Set time zone.
  i18n.defaultLocale = "en_US.UTF-8";  # Select internationalisation properties.


  security = {
    rtkit.enable = true; # rtkit is optional but recommended
    # sudo.configFile = {
    #   "/etc/sudoers.d/pwfeedback" = { # Add password feedback to sudo prompts.
    #     content = ''
    #       Defaults env_reset,pwfeedback 
    #     '';
    #   };
    # };
  };


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

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=45s
  '';


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