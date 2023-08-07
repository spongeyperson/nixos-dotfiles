{ config, pkgs, ... }:
# System-Level Configurations

let
    # udev rules
    bashAliases = pkgs.writeText "bash_aliases" ''
        alias ll='ls -l'
        alias grep='grep --color=auto'
        alias update='sudo nixos-rebuild switch'
    '';

    # Samba configuration
    sambaConfig = pkgs.writeText "smb.conf" ''
        [global]
        workgroup = MYGROUP
        server string = Samba Server %v

        [shared]
        comment = Shared Folder
        path = /path/to/shared/folder
        read only = no
        guest ok = yes
    '';
in

# Destinations
{
    # Apply the Bash aliases configuration
    home.file.".bash_aliases" = {
        text = bashAliases;
        destination = ".bash_aliases";  # The file will be written to the user's home directory as .bash_aliases
    };

    # Apply the Samba configuration
    home.file."smb.conf" = {
        text = sambaConfig;
        destination = "smb.conf";  # The file will be written to the user's home directory as smb.conf
    };
}

