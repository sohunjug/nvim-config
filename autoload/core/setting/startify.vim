" For startify
let g:startify_padding_left = 15
let s:header = [
    \   '           +---------------------------------------------------------+',
    \   '           |  Welcome to use sohunjug vim config                     |',
    \   '           |                                                         |',
    \   '           |  https://github.com/sohunjug/vim-config                 |',
    \   '           +---------------------------------------------------------+',
    \ ]

let s:footer = [
      \ '                   +-------------------------------------------+',
      \ '                   |                 Vim ^_^                   |',
      \ '                   |    Talk is cheap Show me the code         |',
      \ '                   |                                           |',
      \ '                   |            GitHub:sohunjug                |',
      \ '                   +-------------------------------------------+',
      \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_session_dir = expand(g:plugin_path . "/sessions")
let g:startify_custom_header = s:header
let g:startify_custom_footer = s:footer
let g:startify_files_number = 15
let g:startify_session_number = 15
let g:startify_list_order = [
    \  ['       最近项目:'],
    \  'sessions',
    \  ['       最近文件:'],
    \  'files',
    \  ['       快捷命令:'],
    \  'commands',
    \  ['       常用书签:'],
    \  'bookmarks',
    \ ]
let g:startify_commands = [
    \  {'h': ['帮助', 'help howto']},
    \  {'v': ['版本', 'version']}
    \ ]
