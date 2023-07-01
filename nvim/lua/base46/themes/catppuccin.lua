local M = {}

M.mocha = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

M.base_30 = {
    white = "#D9E0EE",
    darker_black = "#191828",
    black = "#1E1D2D", --  nvim bg
    black2 = "#252434",
    one_bg = "#2d2c3c", -- real bg of onedark
    one_bg2 = "#363545",
    one_bg3 = "#3e3d4d",
    grey = "#474656",
    grey_fg = "#4e4d5d",
    grey_fg2 = "#555464",
    light_grey = "#605f6f",
    red = "#F38BA8",
    baby_pink = "#ffa5c3",
    pink = "#F5C2E7",
    -- line = "#383747", -- for lines like vertsplit
    line = "#ffe9b6",
    green = "#ABE9B3",
    dirty_green = "#9FDB00",
    vibrant_green = "#b6f4be",
    nord_blue = "#8bc2f0",
    blue = "#89B4FA",
    yellow = "#FAE3B0",
    sun = "#ffe9b6",
    purple = "#d0a9e5",
    dark_purple = "#c7a0dc",
    teal = "#B5E8E0",
    orange = "#F8BD96",
    cyan = "#89DCEB",
    statusline_bg = "#3e3d4d",
    lightbg = "#2f2e3e",
    pmenu_bg = "#ABE9B3",
    folder_bg = "#89B4FA",
    lavender = "#c7d1ff",
    custom_blue_grey = "#426C87",
    custom_bright_red = "#EE4B2B",
    custom_bright_green = "#AAFF00",
    custom_bright_orange = "#FFAC1C",
    space = "#45475A",
    surface = "#313244",
    overlay0 = '#6c7086'

}

M.base_16 = {
    base00 = "#1E1D2D",
    base01 = "#282737",
    base02 = "#2f2e3e",
    base03 = "#383747",
    base04 = "#414050",
    base05 = "#bfc6d4",
    base06 = "#ccd3e1",
    base07 = "#D9E0EE",
    base08 = "#F38BA8",
    base09 = "#F8BD96",
    base0A = "#FAE3B0",
    base0B = "#ABE9B3",
    base0C = "#89DCEB",
    base0D = "#89B4FA",
    base0E = "#CBA6F7",
    base0F = "#F38BA8",
}

M.polish_hl = {
    ["@variable"] = { fg = M.base_30.lavender },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin")

return M
