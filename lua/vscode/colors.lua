local colors = {}
colors.get_colors = function()
	local mycolors = {} ---@type table<string,string>

	if vim.o.background == 'dark' then
		mycolors = {
			vscNone = 'NONE',
			vscFront = '#D7DAE0',
			vscBack = '#1B1F27',

			vscTabCurrent = '#1B1F27',
			vscTabOther = '#232833',
			vscTabOutside = '#181C23',

			vscLeftDark = '#20242C',
			vscLeftMid = '#2B313D',
			vscLeftLight = '#5C6370',

			vscPopupFront = '#C8D1DC',
			vscPopupBack = '#21252D',
			vscPopupHighlightBlue = '#2C3E5A',
			vscPopupHighlightGray = '#313846',

			vscSplitLight = '#7F8896',
			vscSplitDark = '#343B48',
			vscSplitThumb = '#3A404C',

			vscCursorDarkDark = '#252A35',
			vscCursorDark = '#4E5565',
			vscCursorLight = '#A9B1C7',
			vscSelection = '#2F3F5F',
			vscLineNumber = '#5B6474',

			vscDiffRedDark = '#4E232B',
			vscDiffRedLight = '#6D2F38',
			vscDiffRedLightLight = '#F7768E',
			vscDiffGreenDark = '#2E4437',
			vscDiffGreenLight = '#375042',
			vscSearchCurrent = '#42506A',
			vscSearch = '#6A4B20',

			vscGitAdded = '#81b88b',
			vscGitModified = '#e2c08d',
			vscGitDeleted = '#c74e39',
			vscGitRenamed = '#73c991',
			vscGitUntracked = '#73c991',
			vscGitIgnored = '#8c8c8c',
			vscGitStageModified = '#e2c08d',
			vscGitStageDeleted = '#c74e39',
			vscGitConflicting = '#e4676b',
			vscGitSubmodule = '#8db9e2',

			vscContext = '#3B4352',
			vscContextCurrent = '#667085',

			vscFoldBackground = '#253040',

			-- Syntax colors
			vscGray = '#7D8590',
			vscViolet = '#B392F0',
			vscBlue = '#569CD6',
			vscDarkBlue = '#223249',
			vscMediumBlue = '#18a2fe',
			vscLightBlue = '#9CDCFE',
			vscGreen = '#6A9955',
			vscBlueGreen = '#4EC9B0',
			vscLightGreen = '#B5CEA8',
			vscRed = '#F44747',
			vscOrange = '#CE9178',
			vscLightRed = '#D16969',
			vscYellowOrange = '#D7BA7D',
			vscYellow = '#DCDCAA',
			vscPink = '#C586C0',
		}
	else
		mycolors = {
			vscNone = 'NONE',
			vscFront = '#343434',
			vscBack = '#FBFBFD',

			vscTabCurrent = '#FBFBFD',
			vscTabOther = '#E6E8EC',
			vscTabOutside = '#F1F2F5',

			vscLeftDark = '#F4F5F7',
			vscLeftMid = '#E8EAEE',
			vscLeftLight = '#F4F5F7',

			vscPopupFront = '#000000',
			vscPopupBack = '#F5F6F8',
			vscPopupHighlightBlue = '#0064c1',
			vscPopupHighlightGray = '#767676',

			vscSplitLight = '#EEEEEE',
			vscSplitDark = '#DDDDDD',
			vscSplitThumb = '#DFDFDF',

			vscCursorDarkDark = '#EEF1F5',
			vscCursorDark = '#6F6F6F',
			vscCursorLight = '#767676',
			vscSelection = '#CFE4FF',
			vscLineNumber = '#9AA1AC',

			vscDiffRedDark = '#FFCCCC',
			vscDiffRedLight = '#FFA3A3',
			vscDiffRedLightLight = '#FFCCCC',
			vscDiffGreenDark = '#DBE6C2',
			vscDiffGreenLight = '#EBF1DD',
			vscSearchCurrent = '#A8AC94',
			vscSearch = '#F8C9AB',

			vscGitAdded = '#587c0c',
			vscGitModified = '#895503',
			vscGitDeleted = '#ad0707',
			vscGitRenamed = '#007100',
			vscGitUntracked = '#007100',
			vscGitIgnored = '#8e8e90',
			vscGitStageModified = '#895503',
			vscGitStageDeleted = '#ad0707',
			vscGitConflicting = '#ad0707',
			vscGitSubmodule = '#1258a7',

			vscContext = '#D2D2D2',
			vscContextCurrent = '#929292',

			vscFoldBackground = '#e6f3ff',

			-- Syntax colors
			vscGray = '#000000',
			vscViolet = '#000080',
			vscBlue = '#0000FF',
			vscDarkBlue = '#007ACC',
			vscLightBlue = '#0451A5',
			vscGreen = '#008000',
			vscBlueGreen = '#16825D',
			vscLightGreen = '#098658',
			vscRed = '#FF0000',
			vscOrange = '#C72E0F',
			vscLightRed = '#A31515',
			vscYellowOrange = '#800000',
			vscYellow = '#795E26',
			vscPink = '#AF00DB',
		}
	end

	-- Other ui specific colors
	mycolors.vscUiBlue = '#084671'
	mycolors.vscUiOrange = '#f28b25'
	mycolors.vscPopupHighlightLightBlue = '#d7eafe'

	return mycolors
end

return colors
