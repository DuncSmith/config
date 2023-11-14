return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.code_actions.shellcheck,
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.terraform_fmt,
      },
    }
  end,
  -- Disable rubocop in a '.sonargraph.yml' if competing with standard
}
