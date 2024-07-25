local vim = vim
local o = vim.o

o.syntax = "enable"
vim.g.editorconfig = true

local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

aucmd("TextYankPost", {
  group = augroup("highlightyank", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
  end,
})


vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.cmd('highlight CursorLine guibg=#44475a')
vim.cmd('highlight CursorColumn guibg=#44475a')


function base16()
    hl = vim.api.nvim_set_hl

    cterm00 = 00
    cterm03 = 08
    cterm05 = 07
    cterm07 = 15
    cterm08 = 01
    cterm0A = 03
    cterm0B = 02
    cterm0C = 06
    cterm0D = 04
    cterm0E = 05
    -- 256 colors
    cterm01 = 18
    cterm02 = 19
    cterm04 = 20
    cterm06 = 21
    cterm09 = 16
    cterm0F = 17

    vim.g.colors_name = "base16"

    -- Vim editor colors
    hl(0, "Bold", { bold = true })
    hl(0, "ColorColumn", { ctermbg = cterm01 })
    hl(0, "Conceal", { ctermfg = cterm0D, ctermbg = cterm00 })
    hl(0, "Cursor", { ctermfg = cterm00, ctermbg = cterm05 })
    hl(0, "CursorColumn", { ctermbg = cterm01 })
    hl(0, "CursorLine", {})
    hl(0, "CursorLineNr", { link = "LineNrActive" })
    hl(0, "Debug", { ctermfg = cterm08 })
    hl(0, "Directory", { ctermfg = cterm0D })
    hl(0, "Error", { ctermfg = cterm00, ctermbg = cterm08 })
    hl(0, "ErrorMsg", { ctermfg = cterm08, ctermbg = cterm00 })
    hl(0, "Exception", { ctermfg = cterm08 })
    hl(0, "FoldColumn", { ctermfg = cterm0C })
    hl(0, "Folded", { ctermfg = cterm03 })
    hl(0, "IncSearch", { ctermfg = cterm01, ctermbg = cterm09 })
    hl(0, "Italic", {})
    hl(0, "LineNr", { link = "LineNrDefault" })
    hl(0, "Macro", { ctermfg = cterm08 })
    hl(0, "MatchParen", { ctermbg = cterm03 })
    hl(0, "ModeMsg", { ctermfg = cterm0B })
    hl(0, "MoreMsg", { ctermfg = cterm0B })
    hl(0, "NonText", {})
    hl(0, "Normal", {})
    hl(0, "PMenu", { ctermfg = cterm05, ctermbg = cterm01 })
    hl(0, "PMenuSel", { ctermfg = cterm01, ctermbg = cterm05 })
    hl(0, "Question", { ctermfg = cterm0D })
    hl(0, "QuickFixLine", { ctermbg = cterm01 })
    hl(0, "Search", { ctermfg = cterm00, ctermbg = cterm0A })
    hl(0, "SignColumn", { ctermfg = cterm03 })
    hl(0, "SpecialKey", { ctermfg = cterm03 })
    hl(0, "StatusLine", { link = "Active" })
    hl(0, "StatusLineNC", { link = "StatusLineNoFocus" })
    hl(0, "Substitute", { ctermfg = cterm01, ctermbg = cterm0A })
    hl(0, "TabLine", { link = "Inactive" })
    hl(0, "TabLineFill", { ctermfg = cterm04 })
    hl(0, "TabLineSel", { link = "Active" })
    hl(0, "Title", { ctermfg = cterm0D })
    hl(0, "TooLong", { ctermfg = cterm08 })
    hl(0, "Underlined", { ctermfg = cterm08 })
    hl(0, "VertSplit", { ctermfg = cterm01 })
    hl(0, "Visual", { ctermbg = cterm02 })
    hl(0, "VisualNOS", { ctermfg = cterm08 })
    hl(0, "WarningMsg", { ctermfg = cterm08 })
    hl(0, "WildMenu", { ctermfg = cterm08 })

    -- Standard syntax highlighting
    hl(0, "Boolean", { ctermfg = cterm09 })
    hl(0, "Character", { ctermfg = cterm08 })
    hl(0, "Comment", { ctermfg = cterm03 })
    hl(0, "Conditional", { ctermfg = cterm0E })
    hl(0, "Constant", { ctermfg = cterm09 })
    hl(0, "Define", { ctermfg = cterm0E })
    hl(0, "Delimiter", { ctermfg = cterm0F })
    hl(0, "Float", { ctermfg = cterm09 })
    hl(0, "Function", { ctermfg = cterm0D })
    hl(0, "Identifier", { ctermfg = cterm08 })
    hl(0, "Include", { ctermfg = cterm0D })
    hl(0, "Keyword", { ctermfg = cterm0E })
    hl(0, "Label", { ctermfg = cterm0A })
    hl(0, "Number", { ctermfg = cterm09 })
    hl(0, "Operator", { ctermfg = cterm05 })
    hl(0, "PreProc", { ctermfg = cterm0A })
    hl(0, "Repeat", { ctermfg = cterm0A })
    hl(0, "Special", { ctermfg = cterm0C })
    hl(0, "SpecialChar", { ctermfg = cterm0F })
    hl(0, "Statement", { ctermfg = cterm08 })
    hl(0, "StorageClass", { ctermfg = cterm0A })
    hl(0, "String", { ctermfg = cterm0B })
    hl(0, "Structure", { ctermfg = cterm0E })
    hl(0, "Tag", { ctermfg = cterm0A })
    hl(0, "Todo", { ctermfg = cterm0A, ctermbg = cterm01 })
    hl(0, "Type", { ctermfg = cterm0A })
    hl(0, "Typedef", { ctermfg = cterm0A })

    -- Diff highlighting
    hl(0, "DiffAdd", { ctermfg = cterm0B })
    hl(0, "DiffAdded", { ctermfg = cterm0B })
    hl(0, "DiffChange", { ctermfg = cterm03 })
    hl(0, "DiffDelete", { ctermfg = cterm08 })
    hl(0, "DiffFile", { ctermfg = cterm08 })
    hl(0, "DiffLine", { ctermfg = cterm0D })
    hl(0, "DiffNewFile", { ctermfg = cterm0B })
    hl(0, "DiffRemoved", { ctermfg = cterm08 })
    hl(0, "DiffText", { bold = true, ctermfg = cterm0D })

    -- Git highlighting
    hl(0, "gitcommitBranch", { ctermfg = cterm09, bold = true })
    hl(0, "gitcommitComment", { ctermfg = cterm03, ctermbg = "" })
    hl(0, "gitcommitDiscarded", { ctermfg = cterm03, ctermbg = "" })
    hl(0, "gitcommitDiscardedFile", { ctermfg = cterm08, ctermbg = "", bold = true })
    hl(0, "gitcommitDiscardedType", { ctermfg = cterm0D, ctermbg = "" })
    hl(0, "gitcommitHeader", { ctermfg = cterm0E, ctermbg = "" })
    hl(0, "gitcommitOverflow", { ctermfg = cterm08, ctermbg = "" })
    hl(0, "gitcommitSelected", { ctermfg = cterm03, ctermbg = "" })
    hl(0, "gitcommitSelectedFile", { ctermfg = cterm0B, ctermbg = "", bold = true })
    hl(0, "gitcommitSelectedType", { ctermfg = cterm0D, ctermbg = "" })
    hl(0, "gitcommitSummary", { ctermfg = cterm0B, ctermbg = "" })
    hl(0, "gitcommitUnmergedFile", { ctermfg = cterm08, ctermbg = "", bold = true })
    hl(0, "gitcommitUnmergedType", { ctermfg = cterm0D, ctermbg = "" })
    hl(0, "gitcommitUntracked", { ctermfg = cterm03, ctermbg = "" })
    hl(0, "gitcommitUntrackedFile", { ctermfg = cterm0A, ctermbg = "" })

    -- GitGutter highlighting
    hl(0, "GitGutterAdd", { ctermfg = cterm0B, ctermbg = cterm00 })
    hl(0, "GitGutterChange", { ctermfg = cterm0D, ctermbg = cterm00 })
    hl(0, "GitGutterChangeDelete", { ctermfg = cterm0E, ctermbg = cterm00 })
    hl(0, "GitGutterDelete", { ctermfg = cterm08, ctermbg = cterm00 })

    -- Spelling highlighting
    hl(0, "SpellBad", { undercurl = true })
    hl(0, "SpellCap", { undercurl = true })
    hl(0, "SpellLocal", { undercurl = true })
    hl(0, "SpellRare", { undercurl = true })

    -- Custom
    hl(0, "Active", { ctermfg = cterm07 })
    hl(0, "CurSearch", { ctermfg = cterm00, ctermbg = cterm09 })
    hl(0, "HorizontalSplit", { ctermfg = cterm01 })
    hl(0, "Inactive", { ctermfg = cterm03 })
    hl(0, "LineNrAbove", { ctermfg = cterm02 })
    hl(0, "LineNrActive", { ctermfg = cterm07, bold = true })
    hl(0, "LineNrBelow", { ctermfg = cterm02 })
    hl(0, "LineNrDefault", { ctermfg = cterm02, bold = true })
    hl(0, "StatusLineNoFocus", { ctermfg = cterm03, nocombine = true })
    hl(0, "StatusLineSeparator", { ctermfg = cterm03 })
end

base16()

