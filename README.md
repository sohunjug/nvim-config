<h1 align="center">Welcome to sohunjug-vim-config 👋</h1>
<p>
  <a href="https://twitter.com/sohunjug">
    <img alt="Twitter: sohunjug" src="https://img.shields.io/twitter/follow/sohunjug.svg?style=social" target="_blank" />
  </a>
</p>

> dein plugin nvim config

Coding ['cpp', 'python', 'nodejs', 'shell']

### 🏠 [Homepage](https://sohunjug.com/)

## Install

```sh

" Initialize:
""Use 'Space' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = "\<Space>"
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = ';'

let g:plugin_path = '~/.vim/plugs'
" Path to python interpreter for neovim
let g:python_host_prog = '/usr/local/var/pyenv/versions/2.7.16/bin/python'
let g:python3_host_prog = '/usr/local/var/pyenv/versions/3.6.8/bin/python'

if !isdirectory(expand(g:plugin_path))
  call mkdir(expand(g:plugin_path), 'p')
endif

if !exists('s:config_dir')
  let s:config_dir = finddir('vim-config', $VIMCONFIG)
endif
if s:config_dir != '' || &runtimepath !~ '/vim-config'
  if s:config_dir == '' && &runtimepath !~ '/vim-config'
    let s:config_dir = expand(g:plugin_path) . '/repos/github.com/sohunjug/vim-config'
    if !isdirectory(s:config_dir)
      echomsg 'Download sohunjug vim config wait a moment'
      execute '!git clone https://github.com/sohunjug/vim-config' s:config_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:config_dir, ':p'), '/$', '', '')
endif

execute 'source' fnameescape(resolve(expand(s:config_dir . '/autoload/init.vim')))

colorscheme gruvbox

```

## Author

👤 **sohunjug**

- Twitter: [@sohunjug](https://twitter.com/sohunjug)
- Github: [@sohunjug](https://github.com/sohunjug)

## Show your support

Give a ⭐️ if this project helped you!

---

## Thanks

[ThinkVim](https://github.com/taigacute/ThinkVim)
[SpaceVim](https://github.com/SpaceVim/SpaceVim)

