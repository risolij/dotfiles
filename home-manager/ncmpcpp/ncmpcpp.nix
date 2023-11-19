{ config, pkgs, ... }:

{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = ~/music;
    settings = {
      header_visibility = "no";
      volume_color = "green";
      state_line_color = "black";
      progressbar_look = "━━━";
      playlist_display_mode = "classic";
      song_list_format = "$5%t $R$6%a";
      now_playing_prefix = "$b";
      now_playing_suffix = "$/b";
      browser_playlist_prefix = "$1»$1 ";
    };
  };
}
