# /etc/nixos/system/config/programs/fish.nix
# Fish Shell & Aliases Config

{
    config,
    pkgs,
    lib,
    user,
    ...
}:
# Import global-vars.nix
let
    globalVars = import /etc/nixos/global-vars.nix { inherit config pkgs lib; };
    systemVariables = globalVars.systemVariables;
    userVariables = globalVars.userVariables;
in
{
    users = {
        # Set Default Shell to Fish
        users.${userVariables.username}.shell = pkgs.fish; 
    };
    programs = {
        # Install Fish Shell to System
        fish.enable = true; 

        # Tmux Set Fish as Default Shell
        tmux = {
            enable = true;
            extraConfig = ''
                set-option -g default-shell /run/current-system/sw/bin/fish
            '';
        };
        fish.shellAliases = {
            # NixOS Aliases
            listgenerations="sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
            list-generations="sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
            list-gen="sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
            listgen="sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
            nixgc="nix-collect-garbage --delete-older-than 3d";
            update="sudo nix-channel --update ; sudo nixos-rebuild switch --upgrade";
            pkg-env="sudo nix-env -q ; nix-env -q";
            envpkgs="sudo nix-env -q ; nix-env -q";
            pkgversion="sudo nix-env -qa --description";
            nixinfo="nix-shell -p nix-info --run 'nix-info -m'";

            editalias="vim ~/Git\ Projects/spongeyperson/nixos-dotfiles/etc/nixos/system/config/programs/fish.nix";
            vimalias="editalias";
            # General Aliases
            tb="nc termbin.com 9999";
            termbin="nc termbin.com 9999";
            clbin="curl -F 'clbin=<-' https://clbin.com";
            fishconfig="vim /home/tyler/.config/fish/config.fish";
            vi="vim";
            phone="scrcpy -t --bit-rate 15M --max-fps 60";
            grep="grep --color=always";
            mounts="cat /proc/mounts";
            lsmounts="cat /proc/mounts";
            #  neofetch="neofetch --config /home/tyler/.config/neofetch/fedora.conf --ascii_distro Fedora"
            virsh="virsh --connect=qemu:///system";
            duf="duf -hide-fs squashfs";
            CLEAR="clear";
            onedrive="rclone serve webdav chunk-onedrive:/ --vfs-cache-mode writes -P --cache-db-purge";
            ports="sudo lsof -i -P -n | grep LISTEN";
            openports="sudo lsof -i -P -n | grep LISTEN";

            #FLATPAK VSCode
            code="flatpak run com.visualstudio.code";
            vscode="code";

            # File Management Tweaks
            mv="mv -v";
            cp="cp -v";
            mkdir="mkdir -v";
            rm="rm -v";
            ln="ln -v";
            ls="ls -Ch --color=always";
            l="ls -alh --color=always";
            ".."="cd ..";
            "..."="cd -";
            chmod="chmod -v";
            chown="chown -v";

            # SSH
            sshkeys="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";
            sshkey="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";
            keys="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";
            key="echo -e '\033[0;32mAuthorized SSH Devices:\033[0m' && ls /home/$USER/.ssh/ssh-identities/ -1I '*.pub'";

            # Manipulate KDE
            lockwidgets="echo -e '\033[0;31mWidgets Locked\033[0m' ; qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(true)'";
            unlockwidgets="echo -e '\033[0;32mWidgets Unlocked\033[0m' ; qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(false)'";
            restartkwin="killall kwin_x11 ; nohup kstart5 kwin_x11 </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin Restarted'";
            restartkwin_x11="killall kwin_x11 ; nohup kstart5 kwin_x11 </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin (X11) Restarted'";
            restartkwin_wayland="killall kwin_wayland ; nohup kstart5 kwin_wayland </dev/null &>/dev/null & ; echo -e '\033[0;32mKwin (Wayland) Restarted'";
            restartplasma="killall plasmashell ; nohup kstart5 plasmashell </dev/null &>/dev/null & ; echo -e '\033[0;32mPlasma Shell Restarted'";
            # rebootplasma="kquitapp5 plasmashell && kstart5 plasmashell > /dev/null 2>&1";
            rebootplasma="plasmashell --replace &";
            restartdock="killall latte-dock ; nohup kstart5 latte-dock </dev/null &>/dev/null & ; echo -e '\033[0;32mLatte Dock Restarted'";

            # Manipulate System
            restartpipewire="systemctl --user restart pipewire.{socket,service} ; systemctl --user restart pipewire-pulse.{socket,service} ; echo -e '\033[0;32mPipewire Restarted'";
            restartaudio="systemctl --user restart pipewire.{socket,service} ; systemctl --user restart pipewire-pulse.{socket,service} ; echo -e '\033[0;32mPipewire Restarted'";

            # Manipulate Kraken X62 Hardware (No longer installed)
            # liquid="sudo liquidctl --match kraken set fan speed 20 30  30 40  35 45  40 55  42 58  43 75  44 80  45 90  46 92  50 100 && sudo liquidctl --match kraken set pump 100 && echo -e '\033[0;32mKraken Pump & Fan Speed Set!\033[0m'";

            # Dotfiles Sync
            config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/";
            dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/";

            # Radeon Vulkan Settings
            radv="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'";
            radv64="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'";
            radv32="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/radeon_icd.i686.json'";
            amdvlk="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd64.json'";
            amdvlk64="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd64.json'";
            amdvlk32="VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/amd_icd32.json'";
            vulkanicd="ls /usr/share/vulkan/icd.d/*.json";
            icd="ls /usr/share/vulkan/icd.d/*.json";
            ##
        };
    };
}
