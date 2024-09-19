function ColorMyStuff(color)
	-- set fallback color
	color = color or 'rose-pine'

	-- everforest options
	if (color == 'everforest') then
		-- contrast level: hard, medium (default), soft
		vim.g.everforest_background = 'hard'
		-- transparency level: 0 (none), 1 (normal), 2 (normal + other)
		vim.g.everforest_transparent_background = 1
	end

	-- enable neovim global transparency
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- set colors
	vim.cmd.colorscheme(color)
end

-- available colorschemes: rose-pine, everforest, kanagawa
ColorMyStuff('kanagawa-dragon')
