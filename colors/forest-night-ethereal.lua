local colors = {
  bg = "#1a2125",
  bg_float = "#222a30",
  bg_highlight = "#3a4a55",
  fg = "#c9d1d9",
  fg_dim = "#6b7280",
  fg_bright = "#ffffff",

  border = "#1a2125",
  border_focused = "#3a4a55",

  black = "#1a2125",
  red = "#E91E63",
  green = "#8FBC8F",
  yellow = "#F39C12",
  blue = "#4ECDC4",
  magenta = "#9B59B6",
  cyan = "#4ECDC4",
  white = "#c9d1d9",

  bright_black = "#4a5568",
  bright_red = "#E91E63",
  bright_green = "#8FBC8F",
  bright_yellow = "#F39C12",
  bright_blue = "#66D9EF",
  bright_magenta = "#9B59B6",
  bright_cyan = "#4ECDC4",
  bright_white = "#ffffff",

  comment = "#4a5568",

  cursor = "#6b8fa3",
  cursor_line = "#3a4a55",
  line_number = "#4a5568",
  line_number_active = "#6b8fa3",

  selection = "#3a4a55",
  search = "#4ECDC4",
  inc_search = "#4ECDC4",

  error = "#c78a7a",
  warning = "#F39C12",
  info = "#4ECDC4",
  hint = "#8FBC8F",

  git_added = "#8FBC8F",
  git_changed = "#F39C12",
  git_deleted = "#c78a7a",
}

local syntax = {
  Attribute = { fg = "#F39C12", style = { "italic" } },
  Boolean = { fg = "#8FBC8F" },
  Character = { fg = "#4ECDC4" },
  Comment = { fg = "#4a5568", style = { "italic" } },
  Conditional = { fg = "#F39C12", style = { "italic" } },
  Constant = { fg = "#8FBC8F" },
  Constructor = { fg = "#9B59B6" },
  Define = { fg = "#F39C12" },
  Delimiter = { fg = "#8fa1b3" },
  Exception = { fg = "#F39C12" },
  Field = { fg = "#66D9EF" },
  Float = { fg = "#8FBC8F" },
  Function = { fg = "#9B59B6" },
  Identifier = { fg = "#c9d1d9" },
  Include = { fg = "#F39C12", style = { "italic" } },
  Keyword = { fg = "#F39C12", style = { "italic" } },
  Label = { fg = "#F39C12" },
  Number = { fg = "#8FBC8F" },
  Operator = { fg = "#c9d1d9" },
  Parameter = { fg = "#c78a7a" },
  PreProc = { fg = "#F39C12" },
  Property = { fg = "#66D9EF" },
  Repeat = { fg = "#F39C12" },
  Special = { fg = "#c78a7a" },
  SpecialChar = { fg = "#F39C12", style = { "bold" } },
  Statement = { fg = "#F39C12" },
  StorageClass = { fg = "#F39C12" },
  String = { fg = "#4ECDC4", style = { "italic" } },
  Structure = { fg = "#c78a7a" },
  Tag = { fg = "#F39C12" },
  Title = { fg = "#c9d1d9", style = { "bold" } },
  Type = { fg = "#c78a7a" },
  Typedef = { fg = "#c78a7a" },
  Variable = { fg = "#c9d1d9" },
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
vim.opt.background = "dark"
vim.g.colors_name = "forest-night-ethereal"

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
  [0] = "#1a2125",
  [1] = "#E91E63",
  [2] = "#8FBC8F",
  [3] = "#F39C12",
  [4] = "#4ECDC4",
  [5] = "#9B59B6",
  [6] = "#4ECDC4",
  [7] = "#c9d1d9",
  [8] = "#4a5568",
  [9] = "#E91E63",
  [10] = "#8FBC8F",
  [11] = "#F39C12",
  [12] = "#66D9EF",
  [13] = "#9B59B6",
  [14] = "#4ECDC4",
  [15] = "#ffffff",
}

if vim.fn.has("terminal") == 1 then
  vim.g.terminal_ansi_colors = term_colors
end
