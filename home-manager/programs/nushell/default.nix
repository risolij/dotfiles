{ config, pkgs, ... }:
{
  programs.nushell = {
    enable = true;

    historyControl = [
      "erasedups"
    ];

    initExtra = ''
      set -o vi
    '';

    shellAliases = {
      jctl = "journalctl -p3 -xb";
      cat = "bat --style=plain";
      info = "info --vi-keys";
      battery = "acpi -bat | grep 'Battery 1' | awk '{print $4}' | tr -d ','";
      clog = ''sudo echo "scale=2; $(cat /tmp/scan.log | wc -l) / $(find /home/req | wc -l) * 100" | bc -l | xargs -I {} echo "Percent Scanned: {}%"'';
      screenshot = ''grim -g "$(slurp)"'';
      nix-upgrade = ''sudo nixos-rebuild switch --flake .'';
      home-upgrade = ''home-manager switch --flake .'';
      osrs = ''flatpak run com.adamcake.Bolt'';
      logout = ''loginctl terminate-user $USER'';
      makepi = ''nix run nixpkgs#nixos-generators -- -f sd-aarch64 --flake .#pi-kube --system aarch64-linux -o ./pi.sd'';
      dots = ''cd ~/Development/git/dotfiles'';
    };
  };
}
