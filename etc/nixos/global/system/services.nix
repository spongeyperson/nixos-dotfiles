# /etc/nixos/global/system/services.nix

{
  config,
  lib,
  pkgs,
  ...
}:
let
  # Define Global Variables from (/etc/nixos/tunables/global-vars.nix)
  globalVars = import /etc/nixos/tunables/global-vars.nix { inherit config pkgs lib; };
  # Simplify Global Variables
  systemVariables = globalVars.systemVariables;
  userVariables = globalVars.userVariables;
in
{
    # Services Configuration:
    services = {
        # System Services

        # Package Kit
        packagekit.enable = true;

        # File System Trimming
        fstrim.enable = true;

        # General Services
        openssh.enable = true;
        flatpak.enable = true;
        teamviewer.enable = true;

        # Open VSCode Server
        openvscode-server.enable = true;

        # Enable CUPS Services to allow printing documents.
        printing.enable = true;

        # Libratbag
        ratbagd.enable = true;
        # Sound Configuration:
        # sound.enable = true;
        # Pulseaudio (Gross)
        # hardware.pulseaudio.enable = true;

        xserver = {
            # Configure keymap in X11, Internationalisation.
            layout = userVariables.keymap;
            #xserver.xkbOptions = "eurosign:e,caps:escape";

            # Enable the X11 windowing system.
            enable = true;
            # Set XServer Default Video Driver
            # GPU Type now defined in (/etc/nixos/tunables/hardware-specific/gpu.nix)
            #videoDrivers = [ systemVariables.gputype ];

            # Enable touchpad support (enabled default in most desktopManager).
            libinput.enable = true;
        };
    };
}
