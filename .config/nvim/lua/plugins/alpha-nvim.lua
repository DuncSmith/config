return {
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      table.insert(
        dashboard.section.buttons.val,
        4,
        dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
      )
    end,
  },
}
