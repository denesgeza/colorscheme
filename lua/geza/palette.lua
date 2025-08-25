local options = require("geza.config").options

-- Default colors {{{
-- Colors which define Nvim's default color scheme:
-- ----------------------------Background -----------------------------|
-- ------------------|------------|------------------|-------------|
--       Color       |    HEX     |    Color         |     HEX     |
---------------------|------------|------------------|-------------|
--   NvimDarkBlue    |  #004C63   |  NvimLightBlue   |   #A6DBFF   |
--   NvimDarkCyan    |  #007373   |  NvimLightCyan   |   #8CF8F7   |
--   NvimDarkGreen   |  #005523   |  NvimLightGreen  |   #B4F6C0   |
--   NvimDarkGrey1   |  #07080D   |  NvimLightGrey1  |   #EEF1F8   |
--   NvimDarkGrey2   |  #14161B   |  NvimLightGrey2  |   #E0E2EA   |
--   NvimDarkGrey3   |  #2C2E33   |  NvimLightGrey3  |   #C4C6CD   |
--   NvimDarkGrey4   |  #4F5258   |  NvimLightGrey4  |   #9B9EA4   |
--   NvimDarkMagenta |  #470045   |  NvimLightMagenta|   #FFCAFF   |
--   NvimDarkRed     |  #590008   |  NvimLightRed    |   #FFC0B9   |
--   NvimDarkYellow  |  #6B5300   |  NvimLightYellow |   #FCE094   |
----------------------------------------------------------------------}}}
local variants = {
	dark = {
		base = "#14161B",
		text = "#E0E2EA",
		iris = "#C4C6CD",
		foam = "#B4F6C0",
		pine = "#8CF8F7",
		subtle = "#9B9EA4",
		surface = "#07080D",
		rose = "#FFC0B9",
		gold = "#FCE094",
		love = "#EB6F92",
		_nc = "#16141F",
		overlay = "#26233A",
		muted = "#6E6A86",
		leaf = "#95B1AC",
		highlight_low = "#16141F",
		highlight_med = "#403D52",
		highlight_high = "#524F67",
		none = "NONE",
	},
	light = {
		base = "#FFFFFF",
		text = "#14161B",
		iris = "#9B9EA4",
		foam = "#005523",
		-- foam = "#470045",
		pine = "#007373",
		subtle = "#524F67",
		surface = "#EEF1F8",
		rose = "#590008",
		gold = "#6B5300",
		love = "#470045",
		_nc = "#EEF1F8",
		-- overlay = "#F2E9E1",
		overlay = "#EEF1F8",
		muted = "#9893A5",
		leaf = "#007373",
		highlight_low = "#EEF1F8",
		highlight_med = "#E0E2EA",
		highlight_high = "#C4C6CD",
		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.light or variants[options.dark_variant or "dark"]
