function! s:jump(char) abort
  let [bufnr, line, column, rest] = getpos("'".a:char)
  if bufnr == 0 && line > 0 || bufnr("%") == bufnr
    execute "normal! `".a:char
  elseif bufnr == 0
    echohl ErrorMsg | echom "E20: Mark not set" | echohl None
  else
    execute "edit #".bufnr
  endif
endfunction

nnoremap <silent> ` :<C-U>call <SID>jump(nr2char(getchar()))<CR>
nnoremap <silent> ' `
