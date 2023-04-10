-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["gh"] = { "^", desc = "Goto line head" },
    ["gl"] = { "$", desc = "Goto line end" },
    ["s0"] = { "<cmd>only<cr>", desc = "only" },
    ["so"] = { "<c-w>_<c-w>|", desc = "only (tmp)" },
    ["<tab>"] = { "%", desc = "Jump pair bracket" },
    -- Telescope
    ["<leader>fD"] = {
      function() require("telescope.builtin").git_files { cwd = "~/.dotfiles" } end,
      desc = "Find dot file",
    },
    ["<leader>fs"] = {
      function() require("telescope.builtin").find_files { cwd = "~/src" } end,
      desc = "Find src file",
    },
    ["<leader>e"] = { "<cmd>Neotree reveal_force_cwd<cr>", desc = "Neotree reveal_force_cwd" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<c-l>"] = { "<C-g>U<Right>", desc = "Right move" },
  },
  c = {
    ["<c-p>"] = { "<up>", desc = "History up" },
    ["<c-n>"] = { "<down>", desc = "History down" },
  },
}
