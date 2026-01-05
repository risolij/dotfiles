{ pkgs, lib, config, ... }:

{
  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = [ "*" ];

      settings = {
        main = {
          leftmeta = "layer(meta)";
        };

        meta = {
          l = "XF86Display";
        };
      };
    };
  };
}
