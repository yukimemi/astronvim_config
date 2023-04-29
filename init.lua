return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    mappings = {
      n = {
        ["gl"] = { "$", desc = "Line end" },
      },
    },
    config = {
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        return opts
      end,
      vtsls = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern "package.json"
        opts.single_file_support = false
        return opts
      end,
      lemminx = {
        settings = {
          xml = {
            format = {
              enabled = true,
              formatComments = true,
              joinCDATALines = false,
              joinCommentLines = false,
              joinContentLines = false,
              spaceBeforeEmptyCloseTag = true,
              splitAttributes = true,
            },
            completion = {
              autoCloseTags = true,
            },
          },
        },
      },
      ["powershell_es"] = {
        settings = {
          powershell = {
            codeFormatting = {
              preset = "OTBS",
              ignoreOneLineBlock = false,
              useCorrectCasing = true,
              autoCorrectAliases = true,
            },
          },
        },
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    concurrency = 20,
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
        reset = not jit.os:find "Windows",
      },
    },
    dev = {
      path = "~/src/github.com/yukimemi",
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- Remap for dealing with word wrap
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    vim.keymap.set("n", "<tab>", "%", { silent = true })

    vim.keymap.set({ "n", "x" }, "gh", "^", { silent = true })
    vim.keymap.set({ "n", "x" }, "gl", "$", { silent = true })

    -- `s` prefix mappings
    vim.keymap.set("n", "s", "<Nop>", { silent = true })
    vim.keymap.set("n", "s0", "<cmd>only<cr>", { silent = true })
    vim.keymap.set("n", "s=", "<c-w>=", { silent = true })
    vim.keymap.set("n", "sH", "<c-w>H", { silent = true })
    vim.keymap.set("n", "sJ", "<c-w>J", { silent = true })
    vim.keymap.set("n", "sK", "<c-w>K", { silent = true })
    vim.keymap.set("n", "sL", "<c-w>L", { silent = true })
    vim.keymap.set("n", "sO", "<cmd>tabonly<cr>", { silent = true })
    vim.keymap.set("n", "sQ", "<cmd>qa<cr>", { silent = true })
    vim.keymap.set("n", "sbk", "<cmd>bd!<cr>", { silent = true })
    vim.keymap.set("n", "sbq", "<cmd>q!<cr>", { silent = true })
    vim.keymap.set("n", "sn", "<cmd>bn<cr>", { silent = true })
    vim.keymap.set("n", "so", "<c-w>_<c-w>|", { silent = true })
    vim.keymap.set("n", "sp", "<cmd>bp<cr>", { silent = true })
    vim.keymap.set("n", "sq", "<cmd>q<cr>", { silent = true })
    vim.keymap.set("n", "sr", "<c-w>r", { silent = true })
    vim.keymap.set("n", "sh", "<cmd>sp<cr>", { silent = true })
    vim.keymap.set("n", "st", "<cmd>tabnew<cr>", { silent = true })
    vim.keymap.set("n", "sv", "<cmd>vs<cr>", { silent = true })
    vim.keymap.set("n", "sw", "<c-w>w", { silent = true })

    vim.api.nvim_create_augroup("MyAutoCmd", { clear = true })
    vim.api.nvim_create_autocmd("UIEnter", {
      group = "MyAutoCmd",
      pattern = "*",
      once = true,
      callback = function()
        vim.opt.mouse = "a"
        if vim.fn.exists ":GuiFont" > 0 then vim.cmd [[GuiFont! HackGen Console NF:h10]] end
        if vim.fn.exists ":GuiTabline" > 0 then vim.cmd [[GuiTabline 0]] end
        if vim.fn.exists ":GuiPopupmenu" > 0 then vim.cmd [[GuiPopupmenu 0]] end
        if vim.fn.exists ":GuiScrollBar" > 0 then vim.cmd [[GuiScrollBar 0]] end
        if vim.fn.exists ":GuiWindowOpacity" > 0 then vim.cmd [[GuiWindowOpacity 0.95]] end

        -- Right Click Context Menu (Copy-Cut-Paste)
        vim.keymap.set({ "n", "i" }, "<RightMouse>", "<cmd>call GuiShowContextMenu()<CR>")
        vim.keymap.set({ "x", "s" }, "<RightMouse>", "<cmd>call GuiShowContextMenu()<CR>gv")
      end,
    })

    if vim.g.neovide then
      vim.g.neovide_transparency = 0.9
      vim.g.neovide_floating_blur_amount_x = 2.0
      vim.g.neovide_floating_blur_amount_y = 2.0
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_profiler = false
      vim.g.neovide_input_use_logo = true
      vim.g.neovide_cursor_vfx_mode = "railgun"
      vim.o.guifont = "HackGen Console NF:h10"
      vim.o.guifontwide = "HackGen Console NF:h10"
    end

    -- wsl.
    if vim.fn.has "wsl" then
      vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
          ["+"] = "clip.exe",
          ["*"] = "clip.exe",
        },
        ["paste"] = {
          ["+"] = 'powershell.exe -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
          ["*"] = 'powershell.exe -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        ["cache_enabled"] = 0,
      }
    end

    -- other plugins
    require("user.plugins.gin").polish()
    require("user.plugins.telescope").polish()
    require("user.plugins.ddu").polish()
    require("user.plugins.noice").polish()
  end,
}
