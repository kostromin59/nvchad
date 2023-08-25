local neotree = require("neo-tree")

neotree.setup({
  popup_border_style = "rounded",
  filesystem = {
    hijack_netrw_behavior = "open_current",
  },
  default_component_configs = {
    icon = {
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
    },
    git_status = {
      symbols = {
        renamed = "󰁕",
        unstaged = "󰄱",
      },
    },
  },
})
