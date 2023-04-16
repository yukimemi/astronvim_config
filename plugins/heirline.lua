return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      vim.g.randomcolorscheme_priority = 0
      table.insert(opts.statusline, 9, {
        provider = function()
          if vim.g.colors_name == nil then
            return " "
          else
            return " " .. vim.g.colors_name .. ": " .. vim.g.randomcolorscheme_priority .. " "
          end
        end,
        hl = { fg = "fg", bg = "bg", bold = true },
        update = { "ColorScheme" },
      })
      return opts
    end,
  },
}
