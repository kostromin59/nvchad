-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  -- FloatBorder = { fg = "green" },
  -- NvimTreeFolderIcon = { fg = "green" },
  -- NvimTreeOpenedFolderIcon = { fg = "green" },
  -- NvimTreeClosedFolderIcon = { fg = "green" },
  --
  -- NvimTreeFolderName = { fg = "green" },
  -- NvimTreeOpenedFolderName = { fg = "green" },
  -- NvimTreeClosedFolderName = { fg = "green" },
}

M.ui = {
  hl_override = {
    CursorLine = { bg = "black2" },
  },
}

return M
