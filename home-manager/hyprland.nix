{ config, pkgs, ... }:
{
  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/hypr";
    recursive = true;
  };

  xdg.configFile."waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/waybar";
    recursive = true;
  };

  xdg.configFile."rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/rofi";
    recursive = true;
  };

}
