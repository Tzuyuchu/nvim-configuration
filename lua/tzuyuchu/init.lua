require'tzuyuchu.remap'
require'tzuyuchu.packer'
require'tzuyuchu.settings'

-- set colors
vim.cmd.colorscheme('rose-pine')
vim.cmd.colorscheme('dracula')
vim.g.airline_theme = 'dracula'

-- WSL clipboard support
vim.cmd([[
    let s:clip='/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
        augroup END
    endif
]])

function Update()
    vim.cmd.write()
    vim.cmd.source()
    vim.cmd.PackerSync()
end
