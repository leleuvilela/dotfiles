{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "Vinicius Vilela";
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
        condition = "gitdir:~/dev/metyis/";
        contents = {
          user = {
            name = "Vinicius Vilela";
            email = "vinicius.vilela@criticalsoftware.com";
          };
        };
      }
    ];
  };
}
