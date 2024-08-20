{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "tmux-sessionizer" (builtins.readFile ../../../scripts/tmux-sessionizer))
  ];
}
