local colors = {
  bg = "#f0ede5",
  bg_float = "#f5f2eb",
  bg_highlight = "#e5e2d9",
  fg = "#3d4540",
  fg_dim = "#6b7280",
  fg_bright = "#3d4540",

  border = "#d4d8db",
  border_focused = "#8FBC8F",

  black = "#3d4540",
  red = "#c74d5c",
  green = "#5a7a4a",
  yellow = "#b8860b",
  blue = "#3a8a82",
  magenta = "#8B5A9C",
  cyan = "#3a8a82",
  white = "#3d4540",

  bright_black = "#6b7280",
  bright_red = "#c74d5c",
  bright_green = "#5a7a4a",
  bright_yellow = "#b8860b",
  bright_blue = "#3a8a82",
  bright_magenta = "#8B5A9C",
  bright_cyan = "#3a8a82",
  bright_white = "#3d4540",

  comment = "#8fa1a8",

  cursor = "#5a6b5a",
  cursor_line = "#dce3d4",
  line_number = "#8fa1a8",
  line_number_active = "#5a6b5a",

  selection = "#dce3d4",
  search = "#8B5A9C",
  inc_search = "#8B5A9C",

  error = "#c74d5c",
  warning = "#b8860b",
  info = "#3a8a82",
  hint = "#5a7a4a",

  git_added = "#5a7a4a",
  git_changed = "#b8860b",
  git_deleted = "#c74d5c",
}

local syntax = {
  Attribute = { fg = "#b8860b", style = { "italic" } },
  Boolean = { fg = "#5a7a4a" },
  Character = { fg = "#3a8a82" },
  Comment = { fg = "#8fa1a8", style = { "italic" } },
  Conditional = { fg = "#b8860b", style = { "italic" } },
  Constant = { fg = "#5a7a4a" },
  Constructor = { fg = "#8B5A9C" },
  Define = { fg = "#b8860b" },
  Delimiter = { fg = "#6b7280" },
  Exception = { fg = "#b8860b" },
  Field = { fg = "#3a8a82" },
  Float = { fg = "#5a7a4a" },
  Function = { fg = "#8B5A9C" },
  Identifier = { fg = "#3d4540" },
  Include = { fg = "#b8860b", style = { "italic" } },
  Keyword = { fg = "#b8860b", style = { "italic" } },
  Label = { fg = "#b8860b" },
  Number = { fg = "#5a7a4a" },
  Operator = { fg = "#3d4540" },
  Parameter = { fg = "#c74d5c" },
  PreProc = { fg = "#b8860b" },
  Property = { fg = "#3a8a82" },
  Repeat = { fg = "#b8860b" },
  Special = { fg = "#c74d5c" },
  SpecialChar = { fg = "#b8860b", style = { "bold" } },
  Statement = { fg = "#b8860b" },
  StorageClass = { fg = "#b8860b" },
  String = { fg = "#3a8a82", style = { "italic" } },
  Structure = { fg = "#c74d5c" },
  Tag = { fg = "#b8860b" },
  Title = { fg = "#3d4540", style = { "bold" } },
  Type = { fg = "#c74d5c" },
  Typedef = { fg = "#c74d5c" },
  Variable = { fg = "#3d4540" },
}

local function hl(group, opts)
  opts = opts or {}
  local fg = opts.fg and { fg = opts.fg } or {}
  local bg = opts.bg and { bg = opts.bg } or {}
  local sp = opts.sp and { sp = opts.sp } or {}
  local style = {}
  if opts.style then
    for _, s in ipairs(opts.style) do
      style[s] = true
    end
  end
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", fg, bg, sp, style))
end

vim.cmd "hi clear"
vim.opt.background = "light"
vim.g.colors_name = "forest-night-ethereal-light"

hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.bg_float })
hl("Cursor", { fg = colors.bg, bg = colors.cursor })
hl("CursorLine", { bg = colors.cursor_line })
hl("CursorLineNr", { fg = colors.line_number_active, bold = true })
hl("LineNr", { fg = colors.line_number })
hl("Visual", { bg = colors.selection })
hl("Search", { bg = colors.search })
hl("Comment", syntax.Comment)
hl("String", syntax.String)
hl("Function", syntax.Function)
hl("Keyword", syntax.Keyword)
hl("Type", syntax.Type)
hl("Constant", syntax.Constant)
hl("Number", syntax.Number)
hl("Operator", syntax.Operator)
hl("Property", syntax.Property)
hl("Tag", syntax.Tag)
hl("Title", syntax.Title)
hl("Delimiter", syntax.Delimiter)

hl("Error", { fg = colors.error })
hl("WarningMsg", { fg = colors.warning })
hl("MoreMsg", { fg = colors.info })

hl("Pmenu", { fg = colors.fg, bg = colors.bg_float })
hl("PmenuSel", { fg = colors.fg, bg = colors.selection })

hl("StatusLine", { fg = colors.fg, bg = colors.bg })
hl("StatusLineNC", { fg = colors.fg_dim, bg = colors.bg })

hl("TabLine", { fg = colors.fg_dim, bg = colors.bg })
hl("TabLineSel", { fg = colors.fg, bg = colors.bg, sp = colors.green, underline = true })

hl("VertSplit", { fg = colors.border, bg = colors.bg })

hl("DiffAdd", { fg = colors.git_added })
hl("DiffChange", { fg = colors.git_changed })
hl("DiffDelete", { fg = colors.git_deleted })

hl("DiagnosticError", { fg = colors.error })
hl("DiagnosticWarn", { fg = colors.warning })
hl("DiagnosticInfo", { fg = colors.info })
hl("DiagnosticHint", { fg = colors.hint })

hl("TSComment", syntax.Comment)
hl("TSString", syntax.String)
hl("TSFunction", syntax.Function)
hl("TSKeyword", syntax.Keyword)
hl("TSKeywordFunction", syntax.Keyword)
hl("TSType", syntax.Type)
hl("TSConstant", syntax.Constant)
hl("TSNumber", syntax.Number)
hl("TSOperator", syntax.Operator)
hl("TSProperty", syntax.Property)
hl("TSTag", syntax.Tag)
hl("TSAttribute", syntax.Attribute)
hl("TSParameter", syntax.Parameter)
hl("TSField", syntax.Field)

hl("@comment", syntax.Comment)
hl("@string", syntax.String)
hl("@function", syntax.Function)
hl("@keyword", syntax.Keyword)
hl("@keyword.function", syntax.Keyword)
hl("@type", syntax.Type)
hl("@constant", syntax.Constant)
hl("@number", syntax.Number)
hl("@operator", syntax.Operator)
hl("@property", syntax.Property)
hl("@tag", syntax.Tag)
hl("@tag.attribute", syntax.Attribute)
hl("@variable", syntax.Variable)
hl("@parameter", syntax.Parameter)
hl("@field", syntax.Field)

local term_colors = {
  [0] = "#3d4540",
  [1] = "#c74d5c",
  [2] = "#5a7a4a",
  [3] = "#b8860b",
  [4] = "#3a8a82",
  [5] = "#8B5A9C",
  [6] = "#3a8a82",
  [7] = "#3d4540",
  [8] = "#6b7280",
  [9] = "#c74d5c",
  [10] = "#5a7a4a",
  [11] = "#b8860b",
  [12] = "#3a8a82",
  [13] = "#8B5A9C",
  [14] = "#3a8a82",
  [15] = "#3d4540",
}

if vim.fn.has("terminal") == 1 then
  vim.g.terminal_ansi_colors = term_colors
end
