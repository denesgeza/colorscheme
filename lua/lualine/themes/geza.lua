local p = require("geza.palette")
local config = require("geza.config")

local bg_base = p.base
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		-- a = { bg = p.rose, fg = p.base, gui = "bold" },
		a = { bg = p.leaf, fg = p.base, gui = "bold" },
		-- b = { bg = p.overlay, fg = p.rose },
		b = { bg = p.highlight_med, fg = p.leaf },
		c = { bg = bg_base, fg = p.text },
	},
	insert = {
		a = { bg = p.foam, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.foam },
		c = { bg = bg_base, fg = p.text },
	},
	visual = {
		a = { bg = p.iris, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.iris },
		c = { bg = bg_base, fg = p.text },
	},
	replace = {
		a = { bg = p.pine, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.pine },
		c = { bg = bg_base, fg = p.text },
	},
	command = {
		a = { bg = p.love, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.love },
		c = { bg = bg_base, fg = p.text },
	},
	inactive = {
		a = { bg = bg_base, fg = p.muted, gui = "bold" },
		b = { bg = bg_base, fg = p.muted },
		c = { bg = bg_base, fg = p.muted },
	},
}
