# /etc/nixos/tunables/programs/declarations/fonts.nix

{
    config,
    pkgs,
    ...
}: {
  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    cascadia-code
  ];
}
