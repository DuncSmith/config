return {
  -- This also requires a filetype to be added in the options.lua file
  -- vim.filetype.add({
  --   pattern = {
  --     [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
  --     [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
  --   },
  -- })

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
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "actionlint" } },
  },
}
