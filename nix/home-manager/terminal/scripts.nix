{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "tmux-sessionizer" (builtins.readFile ../../../scripts/tmux-sessionizer))
    (pkgs.writeShellScriptBin "trans" (builtins.readFile ../../../scripts/trans))
  ];
}
