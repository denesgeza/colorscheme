local options = require("geza.config").options
local variants = {
	dark = {
		base = "#14161B",
		text = "#e0e2ea",
		iris = "#c4c6cd",
		foam = "#b4f6c0",
		pine = "#8cf8f7",
		subtle = "#9b9ea4",
		surface = "#07080D",
		rose = "#ffc0b9",
		gold = "#fce094",
		love = "#eb6f92",
		_nc = "#16141f",
		overlay = "#26233a",
		muted = "#6e6a86",
		leaf = "#95b1ac",
		highlight_low = "#16141f",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
		none = "NONE",
	},
	light = {
		base = "#e0e2ea",
		text = "#14161B",
		iris = "#9b9ea4",
		foam = "#470045",
		pine = "#007373",
		subtle = "#9c99a9",
		surface = "#eef1f8",
		rose = "#590008",
		gold = "#6b5300",
		love = "#b4637a",
		_nc = "#f8f0e7",
		overlay = "#f2e9e1",
		muted = "#9893a5",
		leaf = "#6d8f89",
		highlight_low = "#f4ede8",
		highlight_med = "#dfdad9",
		highlight_high = "#cecacd",
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
