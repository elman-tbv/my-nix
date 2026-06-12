{
flake.nixosModules.desktop = { config, pkgs, inputs, ...}:
let
  repo = pkgs.fetchFromGitHub {
    owner  = "Keyitdev";
    repo   = "sddm-astronaut-theme";
    rev    = "master";
    sha256 = "sha256-+Z1igZ4BxRqXr/lxfHEr3I4n/sX8+AIwUr6JFO9yoWs=";
  };

  sddm-astronaut = pkgs.runCommand "sddm-astronaut-theme" {} ''
    mkdir -p $out/share/sddm/themes
    cp -r ${repo} $out/share/sddm/themes/sddm-astronaut-theme
  '';
in 
{
  services.displayManager.sddm = {
    enable     = true;
    wayland.enable = true;
    theme      = "sddm-astronaut-theme";

    extraPackages = with pkgs; [
      qt6.qtsvg
      qt6.qtvirtualkeyboard
      qt6.qtmultimedia
    ];
  };

  environment.systemPackages = [ sddm-astronaut ];
};
}
