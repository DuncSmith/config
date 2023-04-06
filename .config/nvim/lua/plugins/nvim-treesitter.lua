return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     --- @diagnostic disable-next-line: missing-parameter
  --     vim.list_extend(opts.ensure_installed, {
  --       ensure_installed = {
  --         "dockerfile",
  --         "go",
  --         "ruby",
  --         "sql",
  --       },
  --     })
  --   end,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      --- @diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, {
        "dockerfile",
        "go",
        "ruby",
        "sql",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true, disable = { "ruby" } },
      -- indent = { enable = true, disable = { "ruby" } },
    }
  }
}
