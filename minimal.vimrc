set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'kevinhwang91/rnvimr'
call plug#end()

tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> R :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

