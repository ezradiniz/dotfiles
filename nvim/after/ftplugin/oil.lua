vim.keymap.set("n", "dax", function()
    require("oil").discard_all_changes()
end, {
    noremap = true,
    silent = true,
    desc = "Discard all changes made to oil buffers",
})
