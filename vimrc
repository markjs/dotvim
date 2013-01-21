execute pathogen#infect()
set nu
set nowrap
set tabstop=2 shiftwidth=2
set expandtab

set hlsearch
set ignorecase
set smartcase

colorscheme slate

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
