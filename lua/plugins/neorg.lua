local modules = {
  ['core.defaults'] = {},
  ['core.completion'] = { config = { engine = 'nvim-cmp', name = '[Norg]' } },
  ['core.integrations.nvim-cmp'] = {},
  ['core.concealer'] = { config = { icon_preset = 'diamond' } },
  ['core.keybinds'] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = '<Leader><Leader>',
    },
  },
  ['core.dirman'] = {
    config = {
      workspaces = {
        skogix = '~/org/skogix',
        work = '~/org/work',
        org = '~/org',
      },
      default_workspace = "notes",
    },
  },
}
local M = {
  'nvim-neorg/neorg',
  ft = 'norg',
  version = "*",
  dependencies = {
    'luarocks.nvim', -- this is it.
    -- "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    -- "nvim-cmp",
    -- "nvim-lua/plenary.nvim",
  },
  --build = ':Neorg sync-parsers', -- and delete this line.
  cmd = 'Neorg',
  opts = {
    load = modules,
  },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.ui"] = {},
        -- ["core.ui.calender"] = {},
        -- ["core.concealer"] = {},
        ["core.concealer"] = {
            config = { -- We added a `config` table!
                icon_preset = "varied", -- And we set our option here.
            },
        },
  ['core.dirman'] = {
    config = {
      workspaces = {
        skogix = '~/org/skogix',
        work = '~/org/work',
        org = '~/org',
      },
      default_workspace = "org",
    },
  },
        -- ["core.dirman"] = {
        --   config = {
        --     workspaces = {
        --       notes = "~/notes",
        --     },
        --     default_workspace = "notes",
        --   },
        -- },
      },
    }
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
return M
