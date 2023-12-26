{   
    pkgs, 
    user, 
    ... 
<<<<<<< Updated upstream:etc/nixos/user/tyler/packages/user-packages.nix
}: {
    users.users.${user} = {
=======
}: 
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    commonVariables = globalVars.commonVariables;
in
{
    #TODO: MOVE TO global-vars.nix
    nixpkgs.config.permittedInsecurePackages = [
        "electron-24.8.6"
        "mailspring-1.11.0"
    ];
    users.users.${commonVariables.username} = {
>>>>>>> Stashed changes:etc/nixos/users/tyler/packages/user-packages.nix
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
