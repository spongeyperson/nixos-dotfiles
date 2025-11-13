# /etc/nixos/system/services/flatpak.nix
# Flatpak Config

{
    config,
    lib,
    pkgs,
    ...
}: {
    # Enable Flatpak
    services.flatpak.enable = true;

    environment = {
        # Ensure KDE sees Flatpak-exported icons and desktop files
        sessionVariables = {
            XDG_DATA_DIRS = [
                "/var/lib/flatpak/exports/share"
                "$HOME/.local/share/flatpak/exports/share"
                "/run/current-system/sw/share"
            ];
        };
        # Install fallback icon theme
        systemPackages = with pkgs; [
            hicolor-icon-theme
        ];
    };

    # (Optional) Rebuild icon cache automatically on login
    systemd.user.services."update-icon-cache" = {
        description = "Update GTK icon cache for Flatpak apps";
        serviceConfig.ExecStart = "${pkgs.gtk3}/bin/gtk-update-icon-cache -f -t $HOME/.local/share/icons/hicolor";
        wantedBy = [ "default.target" ];
    };
}