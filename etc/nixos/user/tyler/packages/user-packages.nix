#TODO: Cleanup
{   
    #commonVariables,
    config,
    pkgs, 
    lib,
    ... 
}: 
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    commonVariables = globalVars.commonVariables;
in
{
    users.users.${commonVariables.username} = {
        packages = with pkgs; [
            # Userspace, GUI
            authy
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

            #Emulators
            pcem
            _86Box
            rpcs3

            # Userspace, GUI, Unstable Pkgs
            #latte-dock

            # Userspace, GUI, noflatpak
            # Versions of Apps that also
            # have flatpak alternatives.
            mailspring
            spotify
            vscode
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
        ];
    };
}
