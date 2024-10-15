return {

-- FIX: 
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
-- ISSUE:
-- VULNERABILITY: 
-- IDEA:
-- DEPRECATED: 
-- REVIEW: 
-- REFACTOR: 
-- DOCS: 
-- BREAKING: 


"folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- related keywords
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    
    -- Custom keywords for GitHub issues, vulnerabilities
    ISSUE = {
      icon = " ", 
      color = "warning", 
      alt = { "GITHUB_ISSUE", "TICKET", "BUGREPORT" },
    },
    SECURITY = {
      icon = " ", 
      color = "error", 
      alt = { "VULNERABILITY", "VULN", "SECURITY_ISSUE" },
    },
    IDEA = {
      icon = " ", 
      color = "hint", 
      alt = { "SUGGESTION", "THOUGHT", "CONCEPT" },
    },

    DEPRECATED = { icon = "󰭿 ", color = "warning", alt = { "SUNSET", "REMOVE", "OLD"} },
    REVIEW = { icon = " ", color = "review", alt = { "CODE-REVIEW", "CR" } },
    REFACTOR = { icon = "♻ ", color = "refactor", alt = { "REDESIGN", "RESTRUCTURE" } },
    DOCS = { icon = " ", color = "docs", alt = { "DOCUMENTATION", "DOC" } },
    BREAKING = { icon = " ", color = "breaking", alt = { "BREAKING-CHANGE" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- merge custom keywords with defaults
  highlight = {
    multiline = true, -- enable multiline todo comments
    multiline_pattern = "^.", -- lua pattern for multiline
    multiline_context = 10, -- extra lines re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- highlight options for the keyword
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern for highlighting (vim regex)
    comments_only = true, -- use treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- file types to exclude from highlighting
  },
  -- named colors with fallbacks
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" },
    -- Custom added colors
critical = { "DiagnosticError", "#FF3333" },  
  performance = { "DiagnosticWarn", "#FFA500" },  
  review = { "DiagnosticHint", "#9370DB" },  
  refactor = { "DiagnosticInfo", "#4682B4" },  
  idea = { "DiagnosticHint", "#FFC300" },  
  docs = { "DiagnosticInfo", "#3CB371" }, 
  breaking = { "DiagnosticError", "#B22222" },  
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  },
}
}
