# ROG G15 Advantage Edition Custom Programs / Config

{
  config,
  lib,
  pkgs,
  ...
}: {
    # System Packages
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    #environment.shells = with pkgs; [ fish ];
    environment = {
        localBinInPath = true;
        systemPackages = with pkgs; [
          asusctl
        ];
    };
    services = {
      asusd = {
        enable = true;
        enableUserService = true;
    };
  };
}
