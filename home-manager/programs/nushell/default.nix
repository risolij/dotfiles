{ config, pkgs, ... }:
{
  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
      edit_mode = "vi";
    };

    extraConfig = ''
      { ||
          if (which direnv | is-empty) {
              return
          }

          direnv export json | from json | default {} | load-env
      }
    '';

    shellAliases = {
      jctl = "journalctl -p3 -xb";
      cat = "bat --style=plain";
      info = "info --vi-keys";
      battery = "acpi -bat | split row -r '\n' | first | split column ',' | get column2";
      clog = ''sudo echo "scale=2; $(cat /tmp/scan.log | wc -l) / $(find /home/req | wc -l) * 100" | bc -l | xargs -I {} echo "Percent Scanned: {}%"'';
      screenshot = ''grim -g "$(slurp)"'';
      nix-upgrade = ''sudo nixos-rebuild switch --flake .'';
      home-upgrade = ''home-manager switch --flake .'';
      osrs = ''flatpak run com.adamcake.Bolt'';
      logout = ''loginctl terminate-user $env.USER'';
      makepi = ''nix run nixpkgs#nixos-generators -- -f sd-aarch64 --flake .#pi-kube --system aarch64-linux -o ./pi.sd'';
      dots = ''cd ~/Development/git/dotfiles'';
      ll = ''ls -al'';
      fg = ''job unfreeze'';
    };
  };
}
