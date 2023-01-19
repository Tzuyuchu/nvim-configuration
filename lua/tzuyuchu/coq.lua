vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        recommended = false,
        pre_select = true,
        jump_to_mark = "<c-j>"
    }
}

vim.cmd [[
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <Tab>   pumvisible() ? (complete_info().selected == -1 ? "\<C-e><Tab>" : "\<C-y>") : "\<Tab>"
ino <silent><expr> <Enter>   pumvisible() ? "\<C-e><Enter>" : "<Enter>"
]]

