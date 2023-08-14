# Programs Configuration - /system/config/programs

{
    pkgs,
    user,
    ...
}: {
    # Programs Configuration:
    programs = {
    # Alternative Steam Install
    steam.enable = true;
    gamemode.enable = true;
    fish.enable = true;
    kdeconnect.enable = true;
    # FIX "GTK themes are not applied in Wayland applications"
    # https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications
    dconf.enable = true;
    
    mtr = {
        # Enable Program SUID Wrapper Support.
        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        enable = true;
    };
    # Enable GNUPG Agent for Security and SSH Support.
    gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
    # Set Tmux Default Shell to Fish
        tmux = {
            enable = true;
            extraConfig = ''
            set-option -g default-shell /run/current-system/sw/bin/fish
            '';
        };
    };
}