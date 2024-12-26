vim.filetype.add({
  extension = {
    tf = "terraform",
  },
  pattern = {
    -- Borrowed from LazyVim
    [".*"] = {
      function(path, buf)
        return vim.bo[buf]
            and vim.bo[buf].filetype ~= "bigfile"
            and path
            and vim.fn.getfsize(path) > 1024 * 500
            and "bigfile"
          or nil
      end,
    },
  },
})
