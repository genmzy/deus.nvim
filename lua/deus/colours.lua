local M = {}

---@class PaletteBackground
---@field bg_dim string
---@field bg0 string
---@field bg1 string
---@field bg2 string
---@field bg3 string
---@field bg4 string
---@field bg5 string
---@field bg_red string
---@field bg_green string
---@field bg_blue string
---@field bg_yellow string

---@class PaletteBase
---@field fg string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field aqua string
---@field blue string
---@field purple string
---@field grey0 string
---@field grey1 string
---@field grey2 string
---@field statusline1 string
---@field statusline2 string
---@field statusline3 string
---@field none string

---@class Palette: PaletteBase,PaletteBackground

---@alias Backgrounds "light" | "dark"
---@alias PaletteBackgrounds table<Backgrounds, PaletteBackground>

---@type PaletteBackgrounds
local soft_background = {
  bg_dim = "#282E37",
  bg0 = "#2C323B",
  bg1 = "#374658",
  bg2 = "#242a32",
  bg3 = "#665c54",
  bg4 = "#5f575c",
  bg5 = "#7c6f64",
  bg_red = "#fb4934",
  bg_green = "#98C379",
  bg_blue = "#83a598",
  bg_yellow = "#fabd2f",
}

local hard_background = {
  bg_dim = "#22282E",
  bg0 = "#242a32",
  bg1 = "#343F4D",
  bg2 = "#21252C",
  bg3 = "#5f575c",
  bg4 = "#585256",
  bg5 = "#7c6f64",
  bg_red = "#fb4934",
  bg_green = "#98C379",
  bg_blue = "#83a598",
  bg_yellow = "#fabd2f",
}

---@type table<Backgrounds, PaletteBase>
local soft_palette = {
  fg = "#ebdbb2",
  red = "#fb4934",
  orange = "#fe8019",
  yellow = "#fabd2f",
  green = "#98c379",
  aqua = "#81be6a",
  blue = "#83a598",
  purple = "#c678dd",
  grey0 = "#d5c4a1",
  grey1 = "#928374",
  grey2 = "#928374",
  statusline1 = "#83a598",
  statusline2 = "#8ec07c",
  statusline3 = "#fb4934",
  none = "NONE",
}

local hard_palette = {
  fg = "#e3d1a3",
  red = "#fb4934",
  orange = "#fe8019",
  yellow = "#fabd2f",
  green = "#98C379",
  aqua = "#81be6a",
  blue = "#83a598",
  purple = "#c678dd",
  grey0 = "#d5c4a1",
  grey1 = "#85796e",
  grey2 = "#85796e",
  statusline1 = "#83a598",
  statusline2 = "#8ec07c",
  statusline3 = "#fb4934",
  none = "NONE",
}

---Generates the colour palette based on the user's config
---@param options Config The package configuration table
---@return Palette
M.generate_palette = function(options)
  local base = options.hard and hard_palette or soft_palette
  ---@type PaletteBackground
  local background_palette

  background_palette = options.hard and hard_background or soft_background

  ---@type Palette
  local combined_palette = vim.tbl_extend("force", base, background_palette)
  options.colours_override(combined_palette)

  return combined_palette
end

return M
