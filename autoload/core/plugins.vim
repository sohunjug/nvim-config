if &compatible
  set nocompatible
endif

if !exists('g:plugin_path')
  let g:plugin_path = '~/.vim/plugins'
endif

let g:plugin_path = expand(g:plugin_path)

let $PLUGPATH = fnamemodify(expand('<sfile>'), ':h').'/setting'

if !exists('s:plugin_config')
  let s:plugin_config = fnamemodify(expand('<sfile>'), ':h').'/plugin.yaml'
endif
if !exists('g:user_plugins_file')
  let g:user_plugin_config = g:plugin_path . '/local_plugin.yaml'
endif

if !exists('g:plugin_setting_dirname')
  let g:plugin_setting_dirname = expand('~/.vim/setting/')
endif

let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
" dein configurations.
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'echo'
let g:dein#enable_notification = 1
let g:dein#install_message_type = 'echo'
let g:dein#install_log_filename = '/tmp/dein.log'
let g:dein#types#git#clone_depth = 1
let g:dein#install_process_timeout = 120
let g:dein#auto_recache = 1

augroup AutoCmd
  autocmd!
  autocmd CursorHold *? syntax sync minlines=300
augroup END

if !exists('s:dein_dir')
  let s:dein_dir = finddir('dein.vim', g:plugin_path)
endif
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand(g:plugin_path . '/repos/github.com/Shougo/dein.vim')
    if !isdirectory(s:dein_dir)
      echomsg 'Download dein plugin management wait a moment'
      execute '!git clone --depth=1 https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

if !exists('s:dein_ui')
  let s:dein_ui = finddir('dein-ui.vim', g:plugin_path)
endif
if s:dein_ui != '' || &runtimepath !~ '/dein-ui.vim'
  if s:dein_ui == '' && &runtimepath !~ '/dein-ui.vim'
    let s:dein_ui = expand(g:plugin_path . '/repos/github.com/Shougo/dein-ui.vim')
    if !isdirectory(s:dein_ui)
      echomsg 'Download dein ui plugin management wait a moment'
      execute '!git clone --depth=1 https://github.com/wsdjeg/dein-ui.vim' s:dein_ui
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_ui, ':p') , '/$', '', '')
endif

let g:spacevim_plugin_manager = 'dein'
let g:spacevim_plugin_manager_processes = 16

let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1

function! s:dein_load_yaml(filename) abort
  " Fallback to use python3 and PyYAML
  python3 << endpython
import vim, yaml
with open(vim.eval('a:filename'), 'r') as f:
  vim.vars['denite_plugins'] = yaml.safe_load(f.read())
endpython

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

set packpath=

if has('gui_running')
   set guioptions+=Mc
   set guifont=Monaco:h11
endif

if dein#load_state(g:plugin_path)
  call dein#begin(g:plugin_path, [expand('<sfile>'), s:plugin_config])
  try
    call dein#add(s:dein_dir)
    call dein#add(s:dein_ui)
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
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
  call dein#save_state()

  filetype plugin indent on
  syntax enable

endif

if dein#check_install()
  " Installation check.
  call SpaceVim#plugins#manager#install()
  " call dein#install()
endif

execute 'source' fnameescape(resolve(expand('$PLUGPATH/allkey.vim')))

filetype plugin indent on
syntax enable

call dein#call_hook('source')
call dein#call_hook('post_source')

function! s:edit_plugin_setting(plugin_name)
  if !isdirectory(g:plugin_setting_dirname)
    call mkdir(g:plugin_setting_dirname)
  endif
  execute 'edit' g:plugin_setting_dirname . '/' . a:plugin_name . '.vim'
endfunction

command! -nargs=1 EditPluginSetting call s:edit_plugin_setting(<q-args>)

if !exists('s:theme_dir')
  let s:theme_dir = finddir('vim-theme', g:plugin_path)
endif
if s:theme_dir != '' || &runtimepath !~ '/vim-theme'
  if s:theme_dir == '' && &runtimepath !~ '/vim-theme'
    let s:theme_dir = expand(g:plugin_path) . '/repos/github.com/sohunjug/vim-theme'
    if !isdirectory(s:theme_dir)
      echomsg 'Download sohunjug vim config wait a moment'
      execute '!git clone --depth=1 https://github.com/sohunjug/vim-theme' s:theme_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:theme_dir, ':p'), '/$', '', '')
endif

if has('nvim')
  let s:vim_config = '~/.config/nvim'
else
  let s:vim_config = '~/.vim'
endif

let s:coc_setting = expand(s:vim_config . "/coc-settings.json")
if !filereadable(s:coc_setting)
  execute '!rm -rf ' . s:coc_setting
  execute '!ln -sf ' . $PLUGPATH . '/coc-settings.json ' . s:coc_setting
endif
