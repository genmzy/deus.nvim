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
local hard_background = {
  bg_dim = "#1e2326", --  not changed
  bg0 = "#2C323B",
  bg1 = "#3c3836",
  bg2 = "#242a32",
  bg3 = "#665c54",
  bg4 = "#7c6f64",
  bg5 = "#7c6f64",
  bg_red = "#fb4934",
  bg_green = "#98C379",
  bg_blue = "#83a598",
  bg_yellow = "#fabd2f",
}

---@type table<Backgrounds, PaletteBase>
local base_palette = {
  fg = "#ebdbb2",
  red = "#fb4934",
  orange = "#fe8019",
  yellow = "#fabd2f",
  green = "#98C379",
  aqua = "#8ec07c",
  blue = "#83a598",
  purple = "#c678dd",
  grey0 = "#d5c4a1",
  grey1 = "#bdae93",
  grey2 = "#928374",
  statusline1 = "#a7c080",
  statusline2 = "#d3c6aa",
  statusline3 = "#e67e80",
  none = "NONE",
}

---Generates the colour palette based on the user's config
---@param options Config The package configuration table
---@return Palette
M.generate_palette = function(options)
  local base = base_palette
  ---@type PaletteBackground
  local background_palette

  background_palette = hard_background

  ---@type Palette
  local combined_palette = vim.tbl_extend("force", base, background_palette)
  options.colours_override(combined_palette)

  return combined_palette
end

return M
