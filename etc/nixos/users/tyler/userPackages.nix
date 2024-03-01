# /etc/nixos/users/tyler/userPackages.nix

{
    config,
    pkgs, 
    lib,
    ... 
}: 
# Import global-vars.nix
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    # Permitted Insecure Packages, moved to /etc/nixos/system/config/nixconfig.nix
    users.users.${userVariables.username} = {
        packages = with pkgs; [
            # Packages with Insecure Package Requirements
            mailspring # Not using Flatpak due to Libsecret issue


            # Userspace, GUI
            #authy
            vlc
            stremio

            # Web Browsers
            brave
            librewolf
            floorp
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
            #gamemode - moved to /etc/nixos/system/services/services.nix
            protonup-qt
            protontricks
            mangohud
            goverlay
            lutris
            bottles
            prismlauncher

            #Emulators
            pcem
            _86Box
            rpcs3

            # Userspace, GUI, Unstable Pkgs
            #latte-dock

            # Userspace, GUI, noflatpak
            # Versions of Apps that also
            # have flatpak alternatives.
            spotify
            #vscode - Temporarily Disabled as it constantly breaks under wayland. Using Flatpak instead. 
            barrier
            anydesk
            teamviewer

            #rustdesk - Temporarily Disabled due to Rust Compilation Errors
            filelight
            gnome-online-accounts
            gnome.gnome-calculator
            gnome.gnome-calendar

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

            # Dropdown terminal
            yakuake
        ];
    };
}
