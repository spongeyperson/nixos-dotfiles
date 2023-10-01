# Fish Shell Configuration - /system/config/programs/fish/default.nix

{
  config,
  lib,
  pkgs,
  ...
}: 
# Import global-vars.nix
let
  globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
  commonVariables = globalVars.commonVariables;
in
{
  imports = [
    ./shellAliases.nix
  ];
}