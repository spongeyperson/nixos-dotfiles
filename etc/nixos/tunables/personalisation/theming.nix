# /etc/nixos/tunables/personalisation/theming.nix

{
    pkgs,
    user,
    ...
}: {
    environment.systemPackages = with pkgs; [
        # THEMING
        materia-theme
        materia-kde-theme
        # Icons
        papirus-icon-theme
        # Cursor
        apple-cursor
    ];
}
