{ pkgs, inputs, ...}:
{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "top";
        widgets = {
          left = [
            { 
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "WiFi";
            }
          ];
        };
      };
    };
  };
}
