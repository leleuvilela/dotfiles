return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--query-driver=/Users/leleuvilela/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-*,/Users/leleuvilela/.platformio/packages/toolchain-xtensa-esp-elf/bin/*",
          },
        },
      },
    },
  },
}
