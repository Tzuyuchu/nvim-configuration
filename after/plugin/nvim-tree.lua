-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>n', function()
    local view = require"nvim-tree.view"
    local api = require'nvim-tree.api'
    local isFocused = string.match(vim.fn.expand('%'), 'NvimTree')
    if view.is_visible() then
        if isFocused then api.tree.close() else api.tree.focus() end
    else
        api.tree.toggle()
    end
end)

-- OR setup with some options
require("nvim-tree").setup({
    open_on_setup = true,
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    hijack_cursor = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "<F2>", action = "rename" },
            },
        },
    },
    git = {
        ignore = false,
        -- show_on_dirs = false,
        show_on_open_dirs = false,
    },
    modified = {
        enable = true,
        show_on_open_dirs = false
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            git_placement = 'after',
            glyphs = { git = {
                unstaged = "★",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "◌",
                deleted = "",
                ignored = "",
                -- ignored = "◌",
            },
        } },
    },
    actions = {
        open_file = {}
    },
    filters = {
        dotfiles = false,
    },
})
