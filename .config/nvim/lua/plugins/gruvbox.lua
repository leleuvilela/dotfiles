return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    init = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark"
      vim.g.gruvbox_contrast_dark = "medium"
      -- Keep the transparent background used by the existing terminal/editor setup.
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox",
        callback = function()
          -- The original Vim theme predates Neovim's diagnostic and floating UI groups.
          local links = {
            FloatTitle = "GruvboxYellowBold",
            PmenuKind = "Pmenu",
            PmenuExtra = "Pmenu",
            PmenuKindSel = "PmenuSel",
            PmenuExtraSel = "PmenuSel",
            BlinkCmpMenuBorder = "FloatBorder",
            BlinkCmpDocBorder = "FloatBorder",
            BlinkCmpSignatureHelpBorder = "FloatBorder",
            SnacksPickerListCursorLine = "PmenuSel",
            TelescopeSelection = "PmenuSel",
            WinSeparator = "GruvboxBg3",
            DiagnosticError = "GruvboxRed",
            DiagnosticWarn = "GruvboxYellow",
            DiagnosticInfo = "GruvboxBlue",
            DiagnosticHint = "GruvboxAqua",
            DiagnosticOk = "GruvboxGreen",
          }
          for group, target in pairs(links) do
            vim.api.nvim_set_hl(0, group, { link = target })
          end
          -- Give floating panels a solid surface and selections a warm, readable contrast.
          for group, hl in pairs({
            NormalFloat = { fg = "#ebdbb2", bg = "#32302f" },
            FloatBorder = { fg = "#928374", bg = "#32302f" },
            FloatTitle = { fg = "#fabd2f", bg = "#32302f", bold = true },
            Pmenu = { fg = "#ebdbb2", bg = "#32302f" },
            PmenuSel = { fg = "#ebdbb2", bg = "#504945", bold = true },
            PmenuSbar = { bg = "#3c3836" },
            PmenuThumb = { bg = "#665c54" },
          }) do
            vim.api.nvim_set_hl(0, group, hl)
          end
          for severity, color in pairs({
            Error = "#fb4934",
            Warn = "#fabd2f",
            Info = "#83a598",
            Hint = "#8ec07c",
            Ok = "#b8bb26",
          }) do
            vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. severity, { undercurl = true, sp = color })
          end
          for _, group in ipairs({ "Normal", "NormalNC", "SignColumn" }) do
            local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
            hl.bg = nil
            vim.api.nvim_set_hl(0, group, hl)
          end
        end,
      })
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
}
