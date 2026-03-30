-- vscode.nvim color scheme
-- Lua port of https://github.com/tomasiser/vim-code-dark
-- By http://github.com/mofiqul
local vscode = {}
local theme = require('vscode.theme')

local function get_default_group_overrides(opts)
	local c = require('vscode.colors').get_colors()
	c = vim.tbl_extend('force', c, opts.color_overrides or {})
	local is_dark = vim.o.background == 'dark'
	local overrides = {
		Search = { fg = is_dark and c.vscBack or '#FFFFFF', bg = c.vscYellowOrange, bold = true },
		IncSearch = { fg = is_dark and c.vscBack or '#FFFFFF', bg = c.vscBlueGreen, bold = true },
		CursorLine = { bg = c.vscCursorDarkDark },
		CursorLineNr = { fg = is_dark and c.vscYellowOrange or c.vscDarkBlue, bg = 'NONE', bold = true },
		NormalFloat = { bg = opts.transparent and 'NONE' or c.vscPopupBack },
		FloatBorder = { fg = c.vscLineNumber, bg = opts.transparent and 'NONE' or c.vscPopupBack },
		WinSeparator = { fg = c.vscSplitDark, bg = 'NONE' },
		LspInlayHint = { fg = is_dark and c.vscYellowOrange or c.vscDarkBlue, bg = 'NONE', italic = true },
		LeapMatch = { fg = is_dark and c.vscBack or '#FFFFFF', bg = c.vscYellowOrange, bold = true },
		LeapBackdrop = { fg = c.vscGray, bg = 'NONE' },
		NeoTreeCursorLine = { bg = is_dark and c.vscPopupHighlightGray or c.vscCursorDarkDark, bold = true },
		BufferCurrent = { fg = c.vscFront, bg = 'NONE', bold = true },
		BufferCurrentIndex = { fg = c.vscFront, bg = 'NONE' },
		BufferCurrentMod = { fg = c.vscYellowOrange, bg = 'NONE', bold = true },
		BufferCurrentSign = { fg = c.vscGray, bg = 'NONE' },
		BufferCurrentIcon = { bg = 'NONE' },
		BufferCurrentTarget = { bg = 'NONE' },
		BufferInactive = { fg = c.vscGray, bg = 'NONE' },
		BufferInactiveIndex = { fg = c.vscGray, bg = 'NONE' },
		BufferInactiveMod = { fg = c.vscGray, bg = 'NONE' },
		BufferInactiveSign = { bg = 'NONE' },
		BufferInactiveTarget = { bg = 'NONE' },
		WhichKeyFloat = { bg = opts.transparent and 'NONE' or c.vscPopupBack },
		['@annotation'] = { fg = c.vscYellowOrange, bg = 'NONE', italic = true },
		['@attribute'] = { fg = c.vscYellowOrange, bg = 'NONE', italic = true },
		['@keyword.modifier.java'] = { link = '@keyword' },
		['@keyword.exception.java'] = { link = '@keyword' },
		['@keyword.type.java'] = { link = '@keyword' },
	}

	if opts.transparent then
		for _, group in ipairs({
			'StatusLine',
			'StatusLineNC',
			'BufferTabpageFill',
			'BufferLineFill',
			'BufferLineBackground',
			'BufferLineBufferVisible',
			'BufferLineBufferSelected',
			'BufferLineSeparator',
			'BufferLineSeparatorVisible',
			'BufferLineSeparatorSelected',
			'BufferLineTabSeparator',
			'BufferLineTabSeparatorSelected',
			'BufferLineCloseButton',
			'BufferLineCloseButtonVisible',
			'BufferLineCloseButtonSelected',
			'BufferLineDiagnostic',
			'BufferLineDiagnosticVisible',
			'BufferLineDiagnosticSelected',
			'BufferLineHint',
			'BufferLineHintVisible',
			'BufferLineHintSelected',
			'BufferLineInfo',
			'BufferLineInfoVisible',
			'BufferLineInfoSelected',
			'BufferLineWarning',
			'BufferLineWarningVisible',
			'BufferLineWarningSelected',
			'BufferLineError',
			'BufferLineErrorVisible',
			'BufferLineErrorSelected',
			'BufferLineModified',
			'BufferLineModifiedVisible',
			'BufferLineModifiedSelected',
			'BufferLineDuplicate',
			'BufferLineDuplicateVisible',
			'BufferLineDuplicateSelected',
			'BufferLinePick',
			'BufferLinePickVisible',
			'BufferLinePickSelected',
			'TabLine',
			'TabLineFill',
			'TabLineSel',
		}) do
			overrides[group] = vim.tbl_extend('force', overrides[group] or {}, { bg = 'NONE' })
		end

		for _, mode in ipairs({ 'normal', 'insert', 'visual', 'replace', 'command', 'terminal' }) do
			for _, section in ipairs({ 'a', 'b', 'c', 'x', 'y', 'z' }) do
				overrides[string.format('lualine_%s_%s', section, mode)] = { bg = 'NONE' }
			end
		end
	end

	return overrides
end

vscode.setup = function(user_opts)
	local defaults = {
		transparent = false,
		italic_comments = true,
		italic_keywords = true,
		italic_parameters = true,
		bold_types = true,
		bold_functions = false,
		bold_constants = true,
		color_overrides = {},
		group_overrides = {},
		disable_nvimtree_bg = true,
	}

	-- backwards compatibility: let users still set settings with global vars
	local global_settings_opts = vim.tbl_extend('force', defaults, {
		transparent = (vim.g.vscode_transparent == true
			or vim.g.vscode_transparent == 1),
		italic_comments = (vim.g.vscode_italic_comment == true
			or vim.g.vscode_italic_comment == 1),
		disable_nvimtree_bg = (vim.g.vscode_disable_nvim_tree_bg == true
			or vim.g.vscode_disable_nvim_tree_bg == 1),
	})

	-- but override global vars settings with setup() settings
	local opts = vim.tbl_extend('force', global_settings_opts, user_opts)

	-- setting transparent to true removes the default background
	if opts.transparent then
		opts.color_overrides.vscBack = 'NONE'
	end

	theme.set_highlights(opts)
	theme.link_highlight()

	local group_overrides = vim.tbl_extend('force', get_default_group_overrides(opts), opts.group_overrides or {})

	for group, val in pairs(group_overrides) do
		vim.api.nvim_set_hl(0, group, val)
	end
end

vscode.change_style = function(style)
	vim.o.background = style
	vim.cmd([[colorscheme vscode]])
end

return vscode
