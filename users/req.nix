{ pkgs, username, ... }:
{
    users = {
        users.${username} = {
            shell = pkgs.nushell;
            isNormalUser = true;
            extraGroups = [
                "audio"
	            "video"
                "input"
                "wheel"
                "networkmanager"
                "kvm"
                "libvirtd"
                "qemu-libvirtd"
                "docker"
            ];
        };

        groups.plugsdev = {};
    };
}
