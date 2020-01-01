let s:icons_dir = expand('<sfile>:h:h') . '/icons/'
let s:icons = {
\ 'ALEErrorSign': 'error',
\ 'ALEStyleErrorSign': 'error',
\ 'ALInfoSign': 'information',
\ 'ALEWarningSign': 'warning',
\ 'ALEStyleWarningSign': 'warning',
\}
let s:icon_ext = has('win32') ? '.ico' : '.png'

function! s:update_icons() abort
  for l:k in keys(s:icons)
    let l:define = sign_getdefined(l:k)
    if empty(l:define) || has_key(l:define[0], 'icon')
      continue
    endif
    let l:define[0]['icon'] = 'c:/users/mattn/vimfiles/plugged/vim-lsp-icons/icons/' . s:icons[l:k] . s:icon_ext
    call sign_define(l:k, l:define[0])
  endfor
endfunction

augroup vimrc_ale_icons
  au!
  autocmd User ALELintPost  call s:update_icons()
augroup END

