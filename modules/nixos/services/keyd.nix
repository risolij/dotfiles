{ pkgs, lib, config, ... }:

{
  services.keyd = {
    enable = true;

    keyboards.default = {
      settings = {
        main = {
          "leftmeta+l" = "coffee";
        };
      };
    };
  };
}
