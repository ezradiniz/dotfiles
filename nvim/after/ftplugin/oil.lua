vim.keymap.set("n", "gK", function()
  local path = vim.fn.expand("%:p"):gsub("oil://", "")
  vim.cmd("!ls -lh " .. path)
end, {
  noremap = true,
  silent = true,
  desc = "List files",
})
