local M = {}

-- Theme name
M.name = 'cabbin'

-- Setup function
function M.setup(opts)
  opts = opts or {}

  -- Reset highlighting
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  -- Set theme name
  vim.g.colors_name = M.name

  -- Apply highlights
  M.set_highlights()
  M.set_terminal_colors()
end

-- Define color palette based on the forest-night screenshot
M.palette = {
  -- Background colors (very dark, like the screenshot)
  bg = '#232B2F', -- Main background (very dark)
  bg_dark = '#18201A', -- Darker background for sidebars
  bg_highlight = '#253128', -- Highlight/selection background

  -- Foreground colors
  fg = '#faf3eb', -- Main text (light gray-blue)
  fg_dark = '#8b95a7', -- Dimmed text (gray)
  fg_gutter = '#4b5263', -- Line numbers (gray)

  -- Main syntax colors from the screenshot
  orange = '#ff8f40', -- Keywords, imports (orange like 'import', 'from')
  green = '#72b886', -- Strings, URLs (green like the URL strings)
  yellow = '#ea9d34', -- Function names, properties
  blue = '#82aaff', -- Functions, methods (like 'async')
  cyan = '#89ddff', -- Special punctuation, operators
  red = '#f07178', -- Error, important keywords
  purple = '#c792ea', -- Special keywords

  -- Additional colors
  comment = '#546e7a', -- Comments (gray)
  selection = '#2c3b51', -- Visual selection

  -- Specific colors from screenshot
  constant_orange = '#f78c6c', -- For constants like MAX_RETRIES
  method_blue = '#82aaff', -- For methods like .get()
  property_green = '#a6cc70', -- For properties
}

-- Define highlight groups
function M.set_highlights()
  local p = M.palette

  -- Helper function to set highlights
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor highlights
  hl('Normal', { fg = p.fg, bg = p.bg })
  hl('NormalFloat', { fg = p.fg, bg = p.bg_dark })
  hl('FloatBorder', { fg = p.blue, bg = p.bg_dark })
  hl('Cursor', { fg = p.bg, bg = p.fg })
  hl('CursorLine', { bg = p.bg_highlight })
  hl('CursorLineNr', { fg = p.yellow, bold = true })
  hl('LineNr', { fg = p.fg_gutter })
  hl('SignColumn', { fg = p.fg_gutter, bg = p.bg })
  hl('StatusLine', { fg = p.fg, bg = p.bg_dark })
  hl('StatusLineNC', { fg = p.comment, bg = p.bg_dark })
  hl('VertSplit', { fg = p.bg_highlight })
  hl('WinSeparator', { fg = p.bg_highlight })

  -- Syntax highlights (matching the screenshot)
  hl('Comment', { fg = p.comment, italic = true })
  hl('Constant', { fg = p.constant_orange })
  hl('String', { fg = p.green })
  hl('Character', { fg = p.green })
  hl('Number', { fg = p.constant_orange })
  hl('Boolean', { fg = p.constant_orange })
  hl('Float', { fg = p.constant_orange })
  hl('Identifier', { fg = p.fg })
  hl('Function', { fg = p.yellow })
  hl('Statement', { fg = p.orange })
  hl('Conditional', { fg = p.orange })
  hl('Repeat', { fg = p.orange })
  hl('Label', { fg = p.orange })
  hl('Operator', { fg = p.cyan })
  hl('Keyword', { fg = p.orange })
  hl('Exception', { fg = p.red })
  hl('PreProc', { fg = p.orange })
  hl('Include', { fg = p.orange })
  hl('Define', { fg = p.purple })
  hl('Type', { fg = p.yellow })
  hl('StorageClass', { fg = p.orange })
  hl('Structure', { fg = p.yellow })
  hl('Special', { fg = p.cyan })
  hl('SpecialChar', { fg = p.cyan })
  hl('Error', { fg = p.red, bold = true })
  hl('Todo', { fg = p.yellow, bold = true })

  -- Search highlights
  hl('Search', { fg = p.bg, bg = p.yellow })
  hl('IncSearch', { fg = p.bg, bg = p.orange })
  hl('CurSearch', { fg = p.bg, bg = p.red })

  -- Visual mode
  hl('Visual', { bg = p.selection })
  hl('VisualNOS', { bg = p.selection })

  -- Diff highlights
  hl('DiffAdd', { fg = p.green, bg = p.bg_dark })
  hl('DiffChange', { fg = p.yellow, bg = p.bg_dark })
  hl('DiffDelete', { fg = p.red, bg = p.bg_dark })
  hl('DiffText', { fg = p.blue, bg = p.bg_dark, bold = true })

  -- Git signs
  hl('GitSignsAdd', { fg = p.green })
  hl('GitSignsChange', { fg = p.yellow })
  hl('GitSignsDelete', { fg = p.red })

  -- Telescope
  hl('TelescopeBorder', { fg = p.blue })
  hl('TelescopeSelection', { bg = p.bg_highlight })
  hl('TelescopeSelectionCaret', { fg = p.orange })
  hl('TelescopeMatching', { fg = p.orange, bold = true })

  -- LSP
  hl('DiagnosticError', { fg = p.red })
  hl('DiagnosticWarn', { fg = p.yellow })
  hl('DiagnosticInfo', { fg = p.blue })
  hl('DiagnosticHint', { fg = p.cyan })

  -- Treesitter highlights (matching the screenshot patterns)
  hl('@variable', { fg = p.fg })
  hl('@variable.builtin', { fg = p.orange })
  hl('@variable.parameter', { fg = p.fg })
  hl('@variable.member', { fg = p.fg })
  hl('@constant', { fg = p.constant_orange })
  hl('@constant.builtin', { fg = p.constant_orange })
  hl('@constant.macro', { fg = p.constant_orange })
  hl('@string', { fg = p.green })
  hl('@string.regex', { fg = p.green })
  hl('@string.escape', { fg = p.cyan })
  hl('@string.special.url', { fg = p.green })
  hl('@character', { fg = p.green })
  hl('@number', { fg = p.constant_orange })
  hl('@boolean', { fg = p.constant_orange })
  hl('@annotation', { fg = p.yellow })
  hl('@attribute', { fg = p.yellow })
  hl('@module', { fg = p.fg })

  -- Functions and methods
  hl('@function', { fg = p.yellow })
  hl('@function.builtin', { fg = p.cyan })
  hl('@function.call', { fg = p.yellow })
  hl('@function.macro', { fg = p.orange })
  hl('@method', { fg = p.yellow })
  hl('@method.call', { fg = p.yellow })
  hl('@constructor', { fg = p.yellow })
  hl('@parameter', { fg = p.fg })

  -- Keywords (orange like in screenshot)
  hl('@keyword', { fg = p.orange })
  hl('@keyword.function', { fg = p.blue }) -- async, await
  hl('@keyword.operator', { fg = p.orange })
  hl('@keyword.import', { fg = p.orange }) -- import, from
  hl('@keyword.storage', { fg = p.orange }) -- const, let, var
  hl('@keyword.repeat', { fg = p.orange })
  hl('@keyword.return', { fg = p.orange })
  hl('@keyword.exception', { fg = p.orange })
  hl('@conditional', { fg = p.orange })
  hl('@repeat', { fg = p.orange })
  hl('@label', { fg = p.orange })
  hl('@operator', { fg = p.cyan })
  hl('@exception', { fg = p.orange })

  -- Types
  hl('@type', { fg = p.yellow })
  hl('@type.builtin', { fg = p.yellow })
  hl('@type.definition', { fg = p.yellow })
  hl('@type.qualifier', { fg = p.orange })

  -- Others
  hl('@namespace', { fg = p.fg })
  hl('@symbol', { fg = p.fg })
  hl('@property', { fg = p.fg })
  hl('@field', { fg = p.fg })
  hl('@include', { fg = p.orange })
  hl('@punctuation.delimiter', { fg = p.fg_dark })
  hl('@punctuation.bracket', { fg = p.fg_dark })
  hl('@punctuation.special', { fg = p.cyan })

  -- Comments
  hl('@comment', { fg = p.comment, italic = true })
  hl('@comment.todo', { fg = p.yellow, bold = true })
  hl('@comment.warning', { fg = p.orange, bold = true })
  hl('@comment.note', { fg = p.blue, bold = true })
  hl('@comment.error', { fg = p.red, bold = true })

  -- Tags (HTML/JSX)
  hl('@tag', { fg = p.red })
  hl('@tag.attribute', { fg = p.yellow })
  hl('@tag.delimiter', { fg = p.fg_dark })

  -- File explorer (matching screenshot's orange files)
  hl('NvimTreeNormal', { fg = p.fg, bg = p.bg_dark })
  hl('NvimTreeNormalNC', { fg = p.fg, bg = p.bg_dark })
  hl('NvimTreeRootFolder', { fg = p.orange, bold = true })
  hl('NvimTreeFolderName', { fg = p.yellow })
  hl('NvimTreeFolderIcon', { fg = p.yellow })
  hl('NvimTreeOpenedFolderName', { fg = p.yellow, bold = true })
  hl('NvimTreeEmptyFolderName', { fg = p.comment })
  hl('NvimTreeFileDirty', { fg = p.yellow })
  hl('NvimTreeExecFile', { fg = p.green })
  hl('NvimTreeGitDirty', { fg = p.yellow })
  hl('NvimTreeGitNew', { fg = p.green })
  hl('NvimTreeGitDeleted', { fg = p.red })
  hl('NvimTreeSpecialFile', { fg = p.orange, underline = true })
  hl('NvimTreeIndentMarker', { fg = p.bg_highlight })
  hl('NvimTreeImageFile', { fg = p.purple })

  -- Neo-tree (alternative file explorer)
  hl('NeoTreeNormal', { fg = p.fg, bg = p.bg_dark })
  hl('NeoTreeNormalNC', { fg = p.fg, bg = p.bg_dark })
  hl('NeoTreeDirectoryName', { fg = p.yellow })
  hl('NeoTreeDirectoryIcon', { fg = p.yellow })
  hl('NeoTreeRootName', { fg = p.orange, bold = true })
  hl('NeoTreeFileName', { fg = p.fg })
  hl('NeoTreeFileIcon', { fg = p.fg })
  hl('NeoTreeFileNameOpened', { fg = p.green })
  hl('NeoTreeIndentMarker', { fg = p.bg_highlight })
  hl('NeoTreeGitAdded', { fg = p.green })
  hl('NeoTreeGitConflict', { fg = p.red })
  hl('NeoTreeGitModified', { fg = p.yellow })
  hl('NeoTreeGitUntracked', { fg = p.comment })

  -- Which Key
  hl('WhichKey', { fg = p.yellow })
  hl('WhichKeyGroup', { fg = p.blue })
  hl('WhichKeyDesc', { fg = p.fg })
  hl('WhichKeySeparator', { fg = p.comment })
  hl('WhichKeyFloat', { bg = p.bg_dark })
  hl('WhichKeyValue', { fg = p.green })

  -- Indent Blankline
  hl('IblIndent', { fg = p.bg_highlight })
  hl('IblScope', { fg = p.comment })

  -- Cmp (completion)
  hl('CmpItemAbbrMatch', { fg = p.orange, bold = true })
  hl('CmpItemAbbrMatchFuzzy', { fg = p.orange, bold = true })
  hl('CmpItemKindFunction', { fg = p.blue })
  hl('CmpItemKindMethod', { fg = p.blue })
  hl('CmpItemKindVariable', { fg = p.cyan })
  hl('CmpItemKindKeyword', { fg = p.orange })
  hl('CmpItemKindText', { fg = p.fg })
  hl('CmpItemKindClass', { fg = p.yellow })
  hl('CmpItemKindModule', { fg = p.yellow })
end

-- Set terminal colors
function M.set_terminal_colors()
  local p = M.palette
  vim.g.terminal_color_0 = p.bg_dark
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.green
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.purple
  vim.g.terminal_color_6 = p.cyan
  vim.g.terminal_color_7 = p.fg
  vim.g.terminal_color_8 = p.comment
  vim.g.terminal_color_9 = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.purple
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.fg_dark
end

return M
