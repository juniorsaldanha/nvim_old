local wk = require "which-key"
local cmd = require "custom.cmd"

local leaderKey = "<leader>"

local generalKeys = {
  e = { "<cmd>Neotree toggle<cr>", "Toggle NeoTree" },
  tt = {
    function()
      require("base46").toggle_transparency()
    end,
    "Toggle Transparency",
  },
}
wk.register(generalKeys, { prefix = leaderKey })

local gitKeys = {
  g = {
    name = "Git",
    g = { "<cmd>LazyGit<cr>", "LazyGit" },
    s = { "<cmd>Git<cr>", "Git Status" },
    b = { "<cmd>GitBlameToggle<cr>", "Git Blame Toggle" },
  }
}
wk.register(gitKeys, { prefix = leaderKey })

local windowKeys = {
  w = {
    name = "Window Manager",
    w = { cmd.nav.pick_window, "Pick Window" },
    s = { cmd.nav.swap_windows, "Swap Windows" },
    e = { "<C-w>=", "Equalize Windows Size" },
    m = { "<C-w>o", "Maximize Window Size" },
    v = {
      name = "Vertical Window Manager",
      i = { "<cmd>vertical resize +5<cr>", "Increase Width" },
      d = { "<cmd>vertical resize -5<cr>", "Decrease Width" },
    },
    h = {
      name = "Horizontal Window Manager",
      i = { "<cmd>resize +5<cr>", "Increase Height" },
      d = { "<cmd>resize -5<cr>", "Decrease Height" },
    },
  },
}
wk.register(windowKeys, { prefix = leaderKey })

local persistenceKeys = {
  S = {
    name = "Session Manager",
    s = { cmd.session.loadDirSession, "Load Session from Current Dir" },
    l = { cmd.session.loadLastSession, "Load Last Session" },
    d = { cmd.session.dontSaveSession, "Don't Save Current Session" },
  },
}
wk.register(persistenceKeys, { prefix = leaderKey })
