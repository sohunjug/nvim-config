" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" command line alias
"cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Write buffer (save)
noremap <localleader>w :w<CR>
imap <C-s> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

"insert a newline
inoremap <C-O> <Esc>o

nnoremap ]b :bp<CR>
nnoremap [b :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>

nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sd :SDelete<CR>
nnoremap <leader>sl :SLoad<CR>
nnoremap <leader>sc :SClose<CR>
if has('nvim')
  nnoremap <leader>fvr :source ~/.config/nvim/init.vim<CR>
  nnoremap <leader>fve :e ~/.config/nvim/init.vim<CR>
else
  nnoremap <leader>fvr :source ~/.vimrc<CR>
  nnoremap <leader>fve :e ~/.vimrc<CR>
endif
nnoremap <leader>. :lcd %:p:h<CR>
"delete buffer
nnoremap <silent> <leader>bl :Buffers<CR>
nmap <leader>y :History:<CR>
nnoremap <C-x>  :bd<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bo :BOnly<CR>

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
"switch windw
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"" Split
noremap <Leader>ws :<C-u>split<CR>
noremap <Leader>wv :<C-u>vsplit<CR>
"smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <localleader>sm :aunmenu TouchBar<CR>
nnoremap <localleader>sr :set invrelativenumber<CR>
nnoremap <localleader>sp :set nopaste! nopaste?<CR>
nnoremap <silent> <localleader>sh :nohl<cr>
nnoremap <localleader>sf :set nofoldenable! nofoldenable?<CR>
" toggleWrap
nnoremap <localleader>sw :set nowrap! nowrap?<CR>
"tabline operation
noremap <leader>bt :tabnew<cr>

"yank to end
nnoremap Y y$

nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" a command which  edit PLugin config easy
nnoremap <leader>pe :EditPluginSetting <Space>

nmap <leader>b1 <Plug>BufTabLine.Go(1)
nmap <leader>b2 <Plug>BufTabLine.Go(2)
nmap <leader>b3 <Plug>BufTabLine.Go(3)
nmap <leader>b4 <Plug>BufTabLine.Go(4)
nmap <leader>b5 <Plug>BufTabLine.Go(5)
nmap <leader>b6 <Plug>BufTabLine.Go(6)
nmap <leader>b7 <Plug>BufTabLine.Go(7)
nmap <leader>b8 <Plug>BufTabLine.Go(8)
nmap <leader>b9 <Plug>BufTabLine.Go(9)
nmap <leader>b0 <Plug>BufTabLine.Go(10)

