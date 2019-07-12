let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <leader>pp :CtrlP<CR>
nnoremap <silent> <leader>pm :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
  let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
  let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
  let s:ctrlp_fallback = 'ack %s --nocolor -f'
  " On Windows use "dir" as fallback command.
elseif (has('win32') || has('win64'))
  let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
else
  let s:ctrlp_fallback = 'find %s -type f'
endif
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': s:ctrlp_fallback
      \ }

" CtrlP extensions
let g:ctrlp_extensions = ['funky']

"funky
nnoremap <Leader>pf :CtrlPFunky<Cr>
