{
  config,
  lib,
  pkgs,
  ...
}: 
let
    user = "tyler";
in
{
    users.users.${user} = {
        packages = with pkgs; [
            # Temp Theme
            materia-theme
            materia-kde-theme

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
            #steam
            heroic
            #gamemode
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
            mailspring
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

            # Userspace,CLI
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
