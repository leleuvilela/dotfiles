{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    aliases = {
      "clone-wt" = "!sh clone-wt";
    };
    extraConfig = {
      user = {
        name = "vinicius";
        email = "viniciusvilela19@gmail.com";
      };
      core = {
        editor = "nvim";
      };
      safe = {
        directory = "*";
      };
      merge = {
          tool = "nvim";
      };
      mergetool = {
          prompt = false;
          nvim = {
              cmd = "nvim -f -c \"Gdiffsplit!\" \"$MERGED\"";
          };
      };
    };
    
    includes = [
      {
        condition = "gitdir:~/dev/personal/";
        contents = {
          user = {
            name = "vinicius";
            email = "viniciusvilela19@gmail.com";
          };
        };
      }
      {

        condition = "gitdir:~/dev/farfetch/";
        contents = {
          user = {
            name = "vinicius";
            email = "ext.vinicius.nunes@farfetch.com";
          };
        };
      }
    ];
  };
}
