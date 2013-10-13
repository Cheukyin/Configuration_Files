"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" C.vim mapleader
let g:C_MapLeader = ','

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=3

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

colorscheme mellow
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set fileencodings=utf-8,gb2312,gb18030
set termencoding=utf-8
set encoding=prc

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"pj""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tpjreat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L(%p%%)
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%7*\ %<%F\                                "File+path
set statusline+=%2*\ %y\ \|                                  "FileType
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}\ \|      "Encoding
set statusline+=%2*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%3*\ CWD:\ %r%{getcwd()}%h\ 
set statusline+=%0*\ row:\ %l/%L\ (%p%%)\ \|             "Rownumber/total (%)
set statusline+=%0*\ col:\ %03c\                            "Colnr
set statusline+=%8*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%1*\ 

"hi User1 ctermfg=#ffdad8  ctermbg=#880c0 cterm=bold 
hi User2 ctermfg=Brown ctermbg=grey cterm=bold 
hi User3 ctermfg=lightgrey  ctermbg=darkblue cterm=bold
"hi User4 ctermfg=#112605  ctermbg=#aefe7B cterm=bold
"hi User5 ctermfg=#051d00  ctermbg=#7dcc7d cterm=bold
hi User7 ctermfg=7*  ctermbg=1* cterm=bold
hi User8 ctermfg=yellow  ctermbg=black cterm=bold
hi User9 ctermfg=darkmagenta  ctermbg=Green cterm=bold
"hi User0 ctermfg=#ffffff  ctermbg=#094afec term=bold
hi string ctermfg=1  ctermbg=black cterm=bold
hi Folded ctermfg=6  ctermbg=0 cterm=bold
hi Comment ctermfg=4 cterm=bold
hi Pmenu ctermfg=black ctermbg=white cterm=bold
hi PmenuSbar ctermfg=0 ctermbg=white cterm=bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set nu

"intelligent completion
filetype plugin indent on
set completeopt=longest,menu
autocmd filetype makefile setlocal noexpandtab

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

let g:miniBufExplMapCTabSwitchBufs = 1

nnoremap <silent> <F3> :Grep<CR>

highlight LineNr ctermfg=lightblue
highlight LineNr ctermbg=black

autocmd FileType c nmap <F5> :make<CR>

command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
      if exists("g:qfix_win") && a:forced == 0
          cclose
          unlet g:qfix_win
      else
          copen 10
          let g:qfix_win = bufnr("$")
      endif
endfunction

set enc=utf-8
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>
nmap <F4> :QFix<CR>

"set foldenable           " enable folden
set foldmethod=syntax    " manual : Folds are created manually.
                         " indent : Lines with equal indent form a fold.
                         " expr   : ��foldexpr�� gives the fold level of a line.
                         " marker : Markers are used to specify folds.
                         " syntax : Syntax highlighting items specify folds.
                         " diff   : Fold text that is not changed.

"set foldclose=all
" use space to folden
"set foldopen-=search     " dont open folds when I search into thm
"set foldopen-=undo       " dont open folds when I undo stuff

imap <C-H> <ESC>i
imap <C-L> <ESC>la

nmap <space> za

"vmap <leader>e :s/^\(\s*\)*/\1\/\//g<CR><leader><cr>

nmap <F12> :source ~/.vimrc<CR>

"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
" 
" function! Fcitx2zh()
"     let s:input_status = system("fcitx-remote")
"     if s:input_status != 2 && g:input_toggle == 1
"         let l:a = system("fcitx-remote -o")
"         let g:input_toggle = 0
"     endif
" endfunction
" 
set ttimeoutlen=150
"�˳�����ģʽ
autocmd InsertLeave * call Fcitx2en()
" "��������ģʽ
" autocmd InsertEnter * call Fcitx2zh()
" "##### auto fcitx end ######

"let g:indent_guides_guide_size=1
"hi IndentGuidesEven ctermbg=white
"hi IndentGuidesOdd  ctermbg=grey 

set mouse=a

au BufNewFile,BufRead *.py,*.pyw setf python
autocmd FileType python let g:pydiction_location = '~/.vim/ftplugin/complete-dict'
"set omnifunc=pythoncomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt=longest,menuone
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

inoremap ( ()<left>
vnoremap ( <S-I>(<ESC>gv<S-A><right>)<ESC>
inoremap < <><left>
vnoremap < <S-I><<ESC>gv<S-A><right>><ESC>
inoremap [ []<left>
vnoremap [ <S-I>[<ESC>gv<S-A><right>]<ESC>
inoremap ' ''<left>
vnoremap ' <S-I>'<ESC>gv<S-A><right>'<ESC>
inoremap " ""<left>
vnoremap " <S-I>"<ESC>gv<S-A><right>"<ESC>
vnoremap { <S-I>{<ESC>gv<S-A><right>}<ESC>

"lisp
let g:slimv_swank_cmd = '! xterm -e clisp -i /home/cheukyin/.vim/slime/start-swank.lisp &'
let g:slimv_repl_split=4
autocmd FileType lisp inoremap ' '
