return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ghaction = { "actionlint" },
      },
    },
    init = function()
      vim.filetype.add({
        pattern = {
          [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
          [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
        },
      })

      -- Support workflow-call issue types
      local lint = require("lint")
      local al = lint.linters.actionlint
      al.args = { "-format", "{{json .}}", "-stdin-filename", "-" }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "actionlint" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.ghaction" },
        },
      },
    },
  },
}
