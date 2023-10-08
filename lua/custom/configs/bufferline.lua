local present, bufferline = pcall(require, "bufferline")
if not present then
  print "Error loading bufferline"
  return
end

-- TODO: Improve this, learn more about this plugin and setup correctly
bufferline.setup {
  options = {
    numbers = function(opts)
      return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
    end,
    number_style = "",
    mappings = true,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)
      -- buf = vim.api.nvim_buf_get_name(buf)
      -- buf = vim.fn.fnamemodify(buf, ":t")
      -- if vim.bo[buf].filetype == "TelescopePrompt" then
      --   return "Telescope"
      -- end
      -- if buf:match("%.md$") then
      --   return vim.fn.fnamemodify(buf, ":t:r")
      -- end
      -- return buf
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = false,
  },
}
