" For startify
let g:startify_enable_special      = 0
let g:startify_relative_path       = 1
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_remove_lines = ['setlocal', 'winheight']
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! Defx -quit' , 
        \ 'silent! TagbarToggle'
        \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ 'plugs/.*/doc',
      \ '/Users/*/Library',
      \ ]

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
