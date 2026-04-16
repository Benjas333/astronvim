-- if true then return {}

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
        Normal = { bg = "none" },
        SignColumn = { bg = "none" },
        FoldColumn = { bg = "none" },
        NormalFloat = { bg = "none" },
        NormalNC = { bg = "none" },
        NormalSB = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { fg = "#F2F3F5", bg = "none" },
        -- CursorLine = { bg = "#181818" },
        LineNr = { fg = "#7D7D7D" }, -- #adb0bb
        CursorLineNr = { fg = "#C8C8C8" },
        LspInlayHint = { fg = "#7D7D7D" },
        Comment = { fg = "#7D7D7D" },
        -- Visual = { bg = "#4C687E" },
        Visual = { bg = "#394E5F" },
        -- WinBar
        WinBar = { bg = "none" },
        WinSeparator = { fg = "#F2F3F5", bg = "none" },
        WinBarNC = { bg = "none" },
        WhichKeyFloat = { bg = "none" },
        -- Telescope
        TelescopeBorder = { bg = "none" },
        TelescopePromptTitle = { bg = "none" },
        TelescopePromptBorder = { bg = "none" },
        TelescopeNormal = { bg = "none" },
        -- Diagnosis
        DiagnositcVirtualTextHint = { fg = "#F2F3F5", bg = "none" },
        DiagnosticVirtualTextWarn = { fg = "#e0af68", bg = "none" },
        DiagnosticVirtualTextInfo = { fg = "#9ece6a", bg = "none" },
        DiagnosticVirtualTextError = { fg = "#bd2c00", bg = "none" },
        -- NeoTree
        NeoTreeNormal = { bg = "none" },
        NeoTreeNormalNC = { bg = "none" },
        NeoTreeCursorLine = { fg = "#5EB7FF", bg = "#181818" },
        NeoTreeTabInactive = { bg = "none" },
        NeoTreeTabSeparatorActive = { bg = "none" },
        NeoTreeTabSeparatorInactive = { bg = "none" },
        NvimTreeTabSeparatorActive = { fg = "#F2F3F5", bg = "none" },
        NvimTreeTabSeparatorInactive = { fg = "#F2F3F5", bg = "none" },
        MiniTabLineFill = { fg = "#F2F3F5", bg = "none" },
        -- Spectre
        -- DiffAdd = { fg = "#9ece6a", bg = "none" },
        -- DiffChange = { fg = "#5EB7FF", bg = "none" },
        -- DiffDelete = { fg = "#bd2c00", bg = "none" },
        -- QuickFixline
        QuickFixline = { bg = "none" },
        -- TabLine
        TabLine = { bg = "none" },
        TabLineSel = { bg = "none" },
        TabLineFill = { bg = "none" },
        -- Search
        Search = { fg = "red" },
        IncSearch = { fg = "red" },
        -- Pmenu
        Pmenu = { bg = "none" },
        PmenuSel = { bg = "none" },
        PmenuSbar = { bg = "none" },
        PmenuThumb = { bg = "none" },
        -- Notifications
        NotifyINFOBody = { bg = "none" },
        NotifyWARNBody = { bg = "none" },
        NotifyERRORBody = { bg = "none" },
        NotifyDEBUGBody = { bg = "none" },
        NotifyTRACEBody = { bg = "none" },
        NotifyINFOBorder = { bg = "none" },
        NotifyWARNBorder = { bg = "none" },
        NotifyERRORBorder = { bg = "none" },
        NotifyDEBUGBorder = { bg = "none" },
        NotifyTRACEBorder = { bg = "none" },
        NotifyBackground = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
