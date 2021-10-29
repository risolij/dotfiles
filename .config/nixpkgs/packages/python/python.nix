with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    requests
    # pandas
    # other python packages you want
  ]; 
  python-with-my-packages = python3.withPackages my-python-packages;
in
