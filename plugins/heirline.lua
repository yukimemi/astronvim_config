return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      vim.g.randomcolorscheme_priority = 0
      table.insert(
        opts.statusline,
        9,
        { provider = " " .. vim.g.colors_name .. ": " .. vim.g.randomcolorscheme_priority .. " " }
      )
      return opts
    end,
  },
}
