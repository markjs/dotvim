execute pathogen#infect()
set nu
set nowrap
set tabstop=2 shiftwidth=2
set expandtab

set hlsearch
set ignorecase
set smartcase

let mapleader=','

colorscheme slate

" I don't like ex mode
map Q <Nop>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!clear && echo 'bundle exec rspec {spec}' && bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

" Tab completion in insert mode (adapted from :help ins-completion)
function! CleverTab()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-P>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    noremap  <buffer> <silent> k k
    noremap  <buffer> <silent> j j
    noremap  <buffer> <silent> 0 0
    noremap  <buffer> <silent> $ $
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$
  endif
endfunction

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

autocmd FileType python setlocal shiftwidth=4 tabstop=4
