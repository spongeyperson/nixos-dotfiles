# /etc/nixos/system/config/programs/programs.nix
# Programs Configuration

{
    pkgs,
    user,
    ...
}: {
    programs = {
        steam.enable = true; # Install Steam to System
        gamemode.enable = true; # Install Feral Gamemode to System
        kdeconnect.enable = true;

        # FIX "GTK themes are not applied in Wayland applications"
        # https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications
        dconf.enable = true;

        # Enable Program SUID Wrapper Support.
        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        mtr.enable = true;

        # Enable GNUPG Agent for Security and SSH Support.
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
    };
}
