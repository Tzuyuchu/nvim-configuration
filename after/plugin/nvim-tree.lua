local HEIGHT_RATIO = 0.8  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

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

local lib = require("nvim-tree.lib")

local git_add = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status.file

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)

  -- If the file is staged, we unstage
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  lib.refresh_tree()
end

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    hijack_cursor = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "<F2>", action = "rename" },
                { key = 'ga', action = "git_add", action_cb = git_add }
            },
        },
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
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
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = false, -- Turn into false from true by default
    },
})
