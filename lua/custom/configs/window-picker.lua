local present, window_picker = pcall(require, "window-picker")
if not present then
  print("Error on loading window-picker")
  return
end

window_picker.setup({
  hint = "floating-big-letter",
  selection_char = "ASDF;LKJ",
  filter_rules = {
    include_current_win = false,
    autoselect_one = true,
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { "neo-tree", "neo-tree-popup", "notify" },
      -- if the buffer type is one of following, the window will be ignored
      buftype = { "terminal", "quickfix" },
    },
  },
})
