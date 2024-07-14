# /etc/nixos/system/config/font-rendering.nix
# Font Rendering & Font Enablement

{
    config,
    pkgs,
    lib,
    ...
}: {
    # System Font Package Config
    fonts = {
        fontDir.enable = true;
        packages = with pkgs; [
            nerdfonts
            powerline-fonts
            cascadia-code
        ];
    };
    # Bindfs Workaround for Flatpak
    # system.fsPackages = [ pkgs.bindfs ];
    # fileSystems = let
    #     mkRoSymBind = path: {
    #         device = path;
    #         fsType = "fuse.bindfs";
    #         options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    #     };
    #     aggregatedFonts = pkgs.buildEnv {
    #         name = "system-fonts";
    #         paths = config.fonts.fonts;
    #         pathsToLink = [ "/share/fonts" ];
    #     };
    # in {
    #     # Create an FHS mount to support flatpak host icons/fonts
    #     "/usr/share/icons" = mkRoSymBind (config.system.path + "/share/icons");
    #     "/usr/share/fonts" = mkRoSymBind (aggregatedFonts + "/share/fonts");
    # };
}