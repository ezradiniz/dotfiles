vim.api.nvim_create_user_command("W", function()
  vim.api.nvim_command("write")
end, { desc = "Write the buffer to the current file" })
