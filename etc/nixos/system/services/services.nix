{
  config,
  lib,
  pkgs,
  ...
}: {
    # Services Configuration:
    services = {
        # General Services
        openssh.enable = true;
        flatpak.enable = true;
        fstrim.enable = true;

        # Virt-Manager Service
        qemuGuest.enable = true;

        # Enable CUPS to print documents.
        printing.enable = true;

        # Libratbag
        ratbagd.enable = true;
        # Sound Configuration:
        # sound.enable = true;
        # Pulseaudio (Gross)
        # hardware.pulseaudio.enable = true;

        xserver = {      
            # Configure keymap in X11, Internationalisation.
            layout = "us";
            #xserver.xkbOptions = "eurosign:e,caps:escape";
            
            # Enable the X11 windowing system.
            enable = true;

            # Enable Plasma 5 Desktop Environment.
            displayManager.sddm.enable = true;
            desktopManager.plasma5.enable = true;
            # Set Plasma Wayland as Default Session
            displayManager.defaultSession = "plasmawayland";
            
            # Enable touchpad support (enabled default in most desktopManager).
            libinput.enable = true;

            #Enable Libvirtd
            #libvirtd.enable = true;
        };

        # Pipewire
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            jack.enable = true;
        };
    };
}