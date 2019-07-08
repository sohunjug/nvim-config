if !exists('g:plugin_path')
  let g:plugin_path = expand('~/.vim/plugins')
endif

let s:plugin_config = fnamemodify(expand('<sfile>'), ':h').'/plugins.yaml'
if !exists('g:user_plugins_file')
  let g:user_plugin_config = g:plugin_path . '/local_plugins.yaml'
endif

if !exists('g:plugin_setting_dirname')
  let g:plugin_setting_dirname = expand('~/.vim/setting/')
endif

let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
" dein configurations.
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'echo'
let g:dein#enable_notification = 1
let g:dein#install_progress_type = 'title'
let g:dein#install_log_filename = '/tmp/dein.log'
let g:dein#auto_recache = 1

function! s:dein_load_yaml(filename) abort
  " Fallback to use python3 and PyYAML
  python3 << endpython
import vim, yaml
with open(vim.eval('a:filename'), 'r') as f:
  vim.vars['denite_plugins'] = yaml.safe_load(f.read())
endpython
  endif

  for plugin in g:denite_plugins
    call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
  endfor
  unlet g:denite_plugins
endfunction

function! s:check_file_notnull(filename)abort
  let content = readfile(a:filename)
  if empty(content)
    return 0
  endif
  return 1
endfunction

let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = g:plugin_path . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      echomsg 'Download dein plugin management wait a moment'
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

if dein#load_state(g:plugin_path)
  call dein#begin(g:plugin_path, [expand('<sfile>'), s:plugin_config])
  try
    call s:dein_load_yaml(s:plugin_config)
    if filereadable(g:user_plugin_config)
      if s:check_file_notnull(g:user_plugin_config)
        call s:dein_load_yaml(g:user_plugin_config)
      endif
    endif
  catch /.*/
    echoerr v:exception
    echomsg 'Error loading config/plugins.yaml...'
    echomsg 'Caught: ' v:exception
    echoerr 'Please run: pip3 install --user PyYAML'
  endtry
  call dein#end()
  if ! s:is_sudo
    call dein#save_state()
  endif

  filetype plugin indent on
  syntax enable

  if dein#check_install()
    " Installation check.
    call dein#install()
    call dein#check_clean()
  endif
endif


function! s:edit_plugin_setting(plugin_name)
  if !isdirectory(g:plugin_setting_dirname)
    call mkdir(g:plugin_setting_dirname)
  endif
  execute 'edit' g:plugin_setting_dirname . '/' . a:plugin_name . '.vim'
endfunction

command! -nargs=1
  \ EditPluginSetting
  \ call s:edit_plugin_setting(<q-args>)
