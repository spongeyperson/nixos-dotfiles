# /etc/nixos/tunables/packages/user-packages.nix
# Define Usermode Packages & Dependancies

{
    pkgs,
    user,
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
    #nixpkgs.config.permittedInsecurePackages = {  };
    
    users.users.${userVariables.username} = {
        packages = with pkgs; [
            # Userspace, GUI
            #authy - Disabled In favor of Flatpak Version
            vlc
            stremio

            # Web Browsers
            brave
            librewolf
            chromium

            # Chat
            webcord
            telegram-desktop

            # Game Streaming Clients
            moonlight-qt
            parsec-bin

            # Gaming
            #steam - moved to system-programs.nix
            heroic
            #gamemode - moved to ../../system/services/services.nix
            protonup-qt
            protontricks
            mangohud
            goverlay
            lutris
            bottles
            prismlauncher

            # Userspace, GUI, Unstable Pkgs
            #latte-dock

            # Userspace, GUI, noflatpak
            # Versions of Apps that also
            # have flatpak alternatives.
            #mailspring
            spotify
            vscode
            barrier
            anydesk
            teamviewer

            #rustdesk - Temporarily Disabled due to Rust Compilation Errors
            filelight
            gnome.gnome-calculator

            # GUI Audio Manipulation
            pavucontrol
            qpwgraph
            easyeffects
            plasma-pa

            # App Images
            appimage-run

            # Art
            krita

            # Userspace, CLI
            flatpak
            android-tools
            scrcpy
            neofetch
            tree
            jdk8
            jdk17

            cryptomator
        ];
    };
}
