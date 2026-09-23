{ pkgs, ... }:

{
    services.mpd = {
        enable = true;
        musicDirectory = "/home/req/Music";
        extraConfig = ''
            audio_output {
                name "PipeWire Sound Server"
                type "pipewire"
            }
        '';
    };
}
