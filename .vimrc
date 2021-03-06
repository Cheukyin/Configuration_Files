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

if has('gui_running')
        set background=light
        colorscheme solarized
else
    set background=dark
endif

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
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

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
set statusline+=%7*\ %<%f\                                "File
set statusline+=%2*\ %y\ \|                                  "FileType
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}\ \|      "Encoding
set statusline+=%2*\ %{&ff}\                              "FileFormat (dos/unix..) 
let cur_cwd=substitute(getcwd(),".*/\\(\\S\\+/\\S\\+$\\)","../\\1","")
set statusline+=%3*\ CWD:\ %r%{cur_cwd}%h\ 
set statusline+=%2*\ row:\ %l/%L\ (%p%%)\ \|             "Rownumber/total (%)
set statusline+=%2*\ col:\ %03c\                            "Colnr
set statusline+=%8*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%1*\ 

"hi User1 ctermfg=#ffdad8  ctermbg=#880c0 cterm=bold 
hi User2 ctermfg=Black ctermbg=grey cterm=bold 
hi User3 ctermfg=yellow  ctermbg=black cterm=bold
"hi User4 ctermfg=#112605  ctermbg=#aefe7B cterm=bold
"hi User5 ctermfg=#051d00  ctermbg=#7dcc7d cterm=bold
hi User7 ctermfg=7*  ctermbg=1* cterm=bold
hi User8 ctermfg=yellow  ctermbg=black cterm=bold
hi User9 ctermfg=darkmagenta  ctermbg=Green cterm=bold
"hi User0 ctermfg=#ffffff  ctermbg=#094afec term=bold
hi string ctermfg=1  ctermbg=black cterm=bold
hi Folded ctermfg=6  ctermbg=0
hi Comment ctermfg=DarkCyan
hi Pmenu ctermfg=black ctermbg=white cterm=bold
hi PmenuSel ctermfg=black ctermbg=DarkCyan cterm=bold
hi PmenuSbar ctermfg=0 ctermbg=white cterm=bold
hi TypeDef ctermfg=DarkCyan  cterm=bold
""hi SpecialKey ctermfg=DarkCyan  cterm=bold
hi PreProc ctermfg=3
hi Normal ctermfg=7

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

"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

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
"map <leader>q :e ~/buffer<cr>

map <leader>q :quit<cr>
map <leader>qa :qa<cr>
map <leader>wq :wq<cr>

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
let g:miniBufExplorerMoreThanOne = 0

nnoremap <silent> <F3> :Grep<CR>

highlight LineNr ctermfg=lightblue
highlight LineNr ctermbg=black

autocmd FileType python
     \ if findfile("makefile",".") == "makefile" || findfile("Makefile",".") == "Makefile" |
     \   setlocal makeprg=make |
     \ else |
     \   setlocal makeprg=python2\ % |
     \ endif |
     \ nnoremap <buffer> <F5> :make<CR>

autocmd FileType c
     \ if findfile("makefile",".") == "makefile" || findfile("Makefile",".") == "Makefile" |
     \   setlocal makeprg=make |
     \ else |
     \   setlocal makeprg=gcc\ -o\ %:r\ %\ -Wall |
     \ endif |
     \ nnoremap <buffer> <F5> :make<CR>

autocmd FileType vim
     \ nnoremap <buffer> <F5> :source %<CR>

autocmd FileType html
     \   setlocal makeprg=chromium\ http://localhost/% |
     \ nnoremap <buffer> <F5> :make<CR>

autocmd FileType php
     \   setlocal makeprg=php\ -l\ % |
     \ nnoremap <buffer> <F12> :make<CR>

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
nmap <F6> :cn<CR><leader>to
nmap <F7> :cp<CR><leader>to
nmap <F4> :QFix<CR>

"set foldenable          " enable folden
set foldmethod=syntax    " manual : Folds are created manually.
                         " indent : Lines with equal indent form a fold.
                         " expr   : ‘foldexpr’ gives the fold level of a line.
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
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
" "进入插入模式
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
au BufNewFile,BufRead,BufEnter *.c,*.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
autocmd FileType lua set omnifunc=luacomplete
set completeopt=longest,menuone
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

inoremap ( ()<left>
vnoremap ( <S-I>(<ESC>gv<S-A><right>)<ESC>
"inoremap < <><left>
"vnoremap < <S-I><<ESC>gv<S-A><right>><ESC>
inoremap [ []<left>
vnoremap [ <S-I>[<ESC>gv<S-A><right>]<ESC>
inoremap ' ''<left>
vnoremap ' <S-I>'<ESC>gv<S-A><right>'<ESC>
inoremap " ""<left>
vnoremap " <S-I>"<ESC>gv<S-A><right>"<ESC>
vnoremap { <S-I>{<ESC>gv<S-A><right>}<ESC>

inoremap <leader><leader> <esc>l
vnoremap <leader><leader> <esc>
nnoremap <leader><leader> <esc>

"just type the lisp filename in zsh and it will run in gnuscreen ,then type ",c" to open the REPL
"Only for clisp shell
let g:slimv_swank_cmd = '! screen clisp -i /home/cheukyin/.vim/slime/start-swank.lisp &'
let g:slimv_repl_split=4
let g:paredit_mode = 0
autocmd FileType lisp inoremap <buffer> ' '

" ",c" to open the repl
"<F10> to send the line under the cursor or the selected text to the repl(work in every mode)
"<F11> to send the whole buffer to the repl(work in every mode)
autocmd FileType lisp noremap <buffer>  <leader>i :ConqueTermVSplit mit-scheme<cr><cr>
autocmd FileType python noremap <buffer> <leader>i :ConqueTermVSplit ipython2<cr><cr>

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
set tags+=tags
"set tags+=~/.vim/tags/reg51
"set tags+=~/.vim/tags/reg52
set tags+=~/.vim/tags/ioCC2530
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"Cscope
"cscope commands:
"add  : Add a new database             (Usage: add file|dir [pre-path] [flags])
"find : Query for a pattern            (Usage: find c|d|e|f|g|i|s|t name)
"       c: Find functions calling this function
"       d: Find functions called by this function
"       e: Find this egrep pattern
"       f: Find this file
"       g: Find this definition
"       i: Find files #including this file
"       s: Find this C symbol
"       t: Find assignments to
"help : Show this message              (Usage: help)
"kill : Kill a connection              (Usage: kill #)
"reset: Reinit all connections         (Usage: reset)
"show : Show connections               (Usage: show)

"find . -type f -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp">files.csope
"sed -i "s/^/\"/;s/$/\"/" files.csope

set switchbuf=useopen
set csto=1
set cspc=3
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add ~/.vim/tags/ZigBee/cscope.out

noremap <leader>vs :vsplit<cr><C-w>l

nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cstag <C-R>=expand("<cword>")<CR><CR>

nmap <C-c><C-c>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-c><C-c>i :vert sscs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-c><C-c>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c> :vsplit<CR>:cstag <C-R>=expand("<cword>")<CR><CR>

nmap <C-_> :vsplit<CR><C-]>

"preview window toggle for ctags
"let g:PreviewSign="off"
"function! TogglePreview()
"    if g:PreviewSign == "on"
"        let g:PreviewSign= "off"
"        pclose
"    else
"        try
"            let wordUnderCursor = expand("<cword>")
"            execute "ptag " . wordUnderCursor
"            let g:PreviewSign="on"
"        catch
"            echo "No tags for " . wordUnderCursor
"        endtry
"    endif
"endfunction

nmap <leader>pt <S-*>N:ptag <C-R>=expand("<cword>")<CR><CR><C-w>kzi<C-w>j
nmap <leader>pd :pclose<CR>:noh<CR>

"update cscope database && ctags
"have to be in the project dir
function! Update_C_Database()
    cs kill -1
    set tags -= tags
    execute "!~/bash_script/update_vim_database&"
    set tags += tags
    cs add cscope.out
endfunction

nmap <F2> :call Update_C_Database()<CR>

"HTML Completion
function! InsertHtmlTag()
    let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
    normal! a>
    let save_cursor = getpos('.')
    let result = matchstr(getline(save_cursor[1]), pat)
    "if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>', 'bn',0,getline('.')) > 0)
    if (search(pat, 'b', save_cursor[1]))
        normal! lyiwf>
        normal! a</
        normal! p
        normal! a>
    endif
    :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
autocmd filetype html,php inoremap > <ESC>:call InsertHtmlTag()<CR>a

"Dictionary:firstly install sdcv(in .vim),then install the library(stardict-langdao-ec-gb,in .vim too)
function! Mydict()
  let expl=system('sdcv -n ' .
        \  expand("<cword>"))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  25vsp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction
nnoremap <leader>f :call Mydict()<CR><C-w>l
nnoremap <leader>fd :bdelete diCt-tmp<cr>

"MRU:Recent Files
let MRU_Max_Entries=50
let MRU_Window_Height=10
let MRU_Auto_Close=1
nnoremap <silent><leader>h :MRU<CR>

"Fuzzyfinder:search files
nnoremap <leader><F8> :FufCoverageFile<cr>
"limit the filetype
nnoremap <leader>sf :let g:fuf_coveragefile_globPatterns=['**/*.']<left><left>
