" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ v /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ v /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" author: @theniceboy
" modify: @matytan
" checkout-list
" vim-esearch
" fmoralesc/worldslice
" sidofc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	autocmd vimenter * pluginstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $XDG_CONFIG_HOME/nvim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" tnoremap <C-K> <C-\><C-K>
" tnoremap <C-O> <C-\><C-K><C-O>
noremap <c-\> :ToggleTerm size=20 direction=float<CR>


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
" noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
"


" Insert Key

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
noremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Delete find pair
nnoremap dy d%

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
"     now change qwert keyboard
" U/E keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" N key: go to the start of the line
noremap <silent> H 0
" I key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
"noremap e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-K> 5<C-y>
noremap <C-J> 5<C-e>



source ~/.config/nvim/cursor_for_qwerty.vim

"If you use Qwerty keyboard, uncomment the next line.
"source $XDG_CONFIG_HOME/nvim/cursor_for_qwerty.vim

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement 命令模式移动
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
"close the window
noremap qf <C-w>o

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source $XDG_CONFIG_HOME/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" TODO:  <12-01-22, matytan> "

" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to Change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<cr>

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap <LEADER>ru :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'vim-pandoc/vim-pandoc'

Plug '907th/vim-auto-save'
"安装插件
Plug 'ferrine/md-img-paste.vim'
" ag ack
Plug 'mileszs/ack.vim'
"自动格式化
Plug 'Chiel92/vim-autoformat'

"git
Plug 'ludovicchabant/vim-gutentags'
" Plug 'LoricAndre/fzterm.nvim'

Plug 'majutsushi/tagbar'

" im-select
if !has('gui_running')
	Plug 'brglng/vim-im-select'
endif

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" Pretty Dress
Plug 'theniceboy/nvim-deus'
"Plug 'arzg/vim-colors-xcode'

" Status line
"Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
Plug 'APZelos/blamer.nvim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'

"auto save
" Plug 'Pocco81/AutoSave.nvim'
" Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" auto format
" Plug 'skywind3000/vim-rt-format'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" Tex
Plug 'lervag/vimtex'
Plug 'neoclide/coc-vimtex'
" CSharp
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Flutter
Plug 'dart-lang/dart-vim-plugin'

" Swift
"Plug 'keith/swift.vim'
"Plug 'arzg/vim-swift'

" Markdown
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'tpope/vim-markdown'
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" If you have nodejs and yarn
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type ysw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'easymotion/vim-easymotion'
Plug 'arcticicestudio/nord-vim'
" Plug 'Konfekt/FastFold'
"
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'theniceboy/pair-maker.vim'
Plug 'theniceboy/vim-move'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Yggdroot/indentLine'

" For general writing
Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

""""""""""""""""""""""
"  lsp neovim  "
""""""""""""""""""""""
" Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'


" Other useful utilities
"Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
"Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'

Plug 'akinsho/toggleterm.nvim'

"joplin in vim
" Plug 'tenfyzhong/joplin.vim'
"
"sonokai
"𝐀𝐧𝐝𝐫𝐨𝐦𝐞𝐝𝐚
"
Plug 'sainnhe/sonokai'
call plug#end()
"
""""""""""""""""""""""
"  END Install  "
""""""""""""""""""""""
set re=0

" ===
" === auto save
" ===
" test
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events =["FocusLost"]
"test
" This will run :TagsGenerate after each save
"let g:auto_save_postsave_hook = 'Autoformat'
"test

"=== autoformat
"===
" vim-pandoc
"
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
noremap <leader>tf :Autoformat<CR>
" au BufWrite * :Autoformat
"
""""""""""""""""""""""
"  neovim LSP  "
""""""""""""""""""""""
" nnoremap <silent> <leader>to <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
" tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>


" joplin set
" let g:joplin_token = "8e878d8afd07c581e12091742bbc9f82b50059c27b44bf72c95a7a35d37e9c272efc7001e9f4d99795a657cf53b6c4f2e6e68809b4084423bbe8af23ab609f10"
" let g:joplin_port = 41184
" experimental
set lazyredraw
"set regexpengine=1

" blamer
let g:blamer_show_in_visual_modes = 0


""""""""""""""""""""""
"  ack use ag  "
""""""""""""""""""""""
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>


" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

" Important!!
if has('termguicolors')
	set termguicolors
endif
"
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

"colorscheme sonokai

colorscheme nord
"color dracula
"color one
"color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================
" ===
" === snippets
" ===


" ===
" === eleline.vim
" ===
"let g:airline_powerline_fonts = 0

" ===
" lualine
" ===

lua << END
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'sonokai',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		},
	sections = {
		lualine_a = {'mode', 'g:coc_status'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {{"diagnostics", sources = {"nvim_diagnostic"}, symbols = {error = " ", warn = " ", info = " ", hint = " "}},'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
		},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
		},
	tabline = {
		lualine_a = {'buffers'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
		},
	extensions = {}
	}
END



""""""""""""""""""""""
" p  imgpast  "
""""""""""""""""""""""

"==p 设置默认储存文件夹。这里表示储存在当前文档所在文件夹下的'pic'文件夹下，相当于 ./pic/
let g:mdip_imgdir = 'pic'
"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
"设置快捷键，个人喜欢 空格 p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <LEADER>p:call mdip#MarkdownClipboardImage()<CR>F%i

"p p pp  p p  ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :gitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>
"gitlens
let g:blamer_enabled = 1
"im-select
let g:im_select_default = 'com.apple.keylayout.ABC'

" ===
" === New Section
" ===


" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
			\ 'coc-css',
			\ 'coc-diagnostic',
			\ 'coc-docker',
			\ 'coc-eslint',
			\ 'coc-explorer',
			\ 'coc-flutter-tools',
			\ 'coc-gitignore',
			\ 'coc-html',
			\ 'coc-import-cost',
			\ 'coc-java',
			\ 'coc-jest',
			\ 'coc-snippets',
			\ 'coc-json',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-prisma',
			\ 'coc-pyright',
			\ 'coc-sourcekit',
			\ 'coc-stylelint',
			\ 'coc-syntax',
			\ 'coc-tailwindcss',
			\ 'coc-translator',
			\ 'coc-tsserver',
			\ 'coc-vetur',
			\ 'coc-vimlsp',
			\ 'coc-markdownlint',
			\ 'coc-yaml',
			\ 'coc-yank',
			\ 'https://github.com/rodrigore/coc-tailwind-intellisense']
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap gh :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gl <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <LEADER>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction
xmap <LEADER>a  <Plug>(coc-codeaction-selected)
nmap <LEADER>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
" noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-n>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'matytan'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
" ===

" === vim-markdown-preview
" ===
"filetype plugin on
"Uncomment to override defaults:
set shell=bash\ -i

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
"let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {},
			\ 'flowchart_diagrams': {},
			\ 'content_editable': v:false,
			\ 'disable_filename': 0
			\ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50

noremap <LEADER>mv :MarkdownPreview<CR>

" If you have nodejs and yarn

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF
" ===
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
"let g:Lf_CommandMap = {
			"\   '<C-k>': ['<C-u>'],
			"\   '<C-j>': ['<C-e>'],
			"\   '<C-]>': ['<C-v>'],
			"\   '<C-p>': ['<C-n>'],
"\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
			\ 'dir': ['.git', 'vendor', 'node_modules'],
			\ 'file': ['__vim_project_root', 'class']
			\}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0


" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'


" ===
" === vim-bookmarks
" ===
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mi <Plug>BookmarkNext
" nmap mn <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1


" ===
" === Undotree
" ===
noremap U :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc




" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
let g:VM_default_mappings = 0
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<C-s>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'


" ===
" === Far.vim
" ===
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
			\ "replace_undo" : ["l"],
			\ }

set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

" shortcut for far.vim find
nnoremap <silent> <Find-Shortcut>  :Farf<cr>
vnoremap <silent> <Find-Shortcut>  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
vnoremap <silent> <Replace-Shortcut>  :Farr<cr>

" ===
" === vim-calc
" ===
"noremap <LEADER>a :call Calc()<CR>
" Testing
"if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
"source ~/Github/vim-calc/vim-calc.vim
"endif


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
" function! NearestMethodOrFunction() abort
"		return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
noremap <LEADER>gk :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/snippets/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END


" ===
" === vimtex
" ===

"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})

let g:tex_flavor = 'latex'
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
"filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
"syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'zathura'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
"let g:vimtex_compiler_method = 'latexrun'

"let g:vimtex_compiler_progname = 'nvr'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
"let maplocalleader = ","
" let g:vimtex_view_method = "skim"
" let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
"
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_method = "skim"
" let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'

" augroup vimtex_mac
"     autocmd!
"     autocmd User VimtexEventCompileSuccess call UpdateSkim()
" augroup END
"
" function! UpdateSkim() abort
"     let l:out = b:vimtex.out()
"     let l:src_file_path = expand('%:p')
"     let l:cmd = [g:vimtex_view_general_viewer, '-r']
"
"     if !empty(system('pgrep Skim'))
"     call extend(l:cmd, ['-g'])
"     endif
"
"     call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
" endfunction
"
" augroup vimtex_mac
"   autocmd!
"   autocmd FileType tex call SetServerName()
" augroup END
"
" function! SetServerName()
"   call system('echo ' . v:servername . ' > /tmp/curvimserver')
" endfunction



let g:vimtex_toc_config = {
			\ 'name' : 'TOC',
			\ 'layers' : ['content', 'todo', 'include'],
			\ 'split_width' : 25,
			\ 'todo_sorted' : 0,
			\ 'show_help' : 1,
			\ 'show_numbers' : 1,
			\}

" map
autocmd FileType tex noremap tc :VimtexTocToggle<CR>
autocmd FileType tex noremap to :VimtexTocOpen<CR>
autocmd FileType tex noremap tv :VimtexView<CR>


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> h <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> j <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-k> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-h> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-j> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-l> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> I <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

"autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
" autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
" autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
" autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

" ===
" === OmniSharp
" ===
" let g:OmniSharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1
"
" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'ctrlp'
"
" autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
" autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
" autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
" autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
" autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>
"
" sign define OmniSharpCodeActions text=💡
"
" let g:coc_sources_disable_map = { 'cs': ['cs', 'cs-1', 'cs-2', 'cs-3'] }

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
" map ' <Plug>(easymotion-overwin-f2)
" nmap ' <Plug>(easymotion-overwin-f2)
"map E <Plug>(easymotion-j)
"map U <Plug>(easymotion-k)
"nmap f <Plug>(easymotion-overwin-f)
"map \; <Plug>(easymotion-prefix)
"nmap ' <Plug>(easymotion-overwin-f2)
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)


" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1


" ===
" === tabular
" ===
vmap ga :Tabularize /


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
"noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>


" ===
" === vim-session
" ===
"let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
""noremap sA :AppendTabSession<CR>


" ===
" === context.vim
"i ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


" ===
" === reply.vim
" ===
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>


" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <leader>rm :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
" nnoremap <silent> <LEADER>rm :RnvimrToggle<CR>
" tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>



" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6


" ===
" === dart-vim-plugin
" ===
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]


" ===
" === tcomment_vim
" " =
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ===
" === vim-move
" ===
let g:move_key_modifier = 'C'


" ===
" === any-jump
" ===
nnoremap gj :AnyJump<CR>
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9


" ===
" === typescript-vim
" ===
let g:typescript_ignore_browserwords = 1


" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1


" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"typescript", "dart", "java","c","cpp","bash"},     -- one of "all", "language", or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
disable = { "c", "rust" },  -- list of language that will be disabled
},
	 rainbow = {
	 enable = true,
	 -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
	 extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	 max_file_lines = nil, -- Do not enable for files with more than n lines, int
	 -- colors = {}, -- table of hex strings
	 -- termcolors = {} -- table of colour name strings
	 },
 }
EOF


" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" " AutoSave
" lua << EOF
" local autosave = require("autosave")
"
" autosave.setup(
"     {
"         enabled = true,
"         execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
"         events = {"InsertLeave", "TextChanged"},
"         conditions = {
"             exists = true,
"             filename_is_not = {},
"             filetype_is_not = {},
"             modifiable = true
"         },
"         write_all_buffers = false,
"         on_off_commands = true,
"         clean_command_line_interval = 0,
"         debounce_delay = 135
"     }
" )
" EOF

" ===================== End of Plugin Settings =====================

" ===
" === Terminal Colors
" ===

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
let g:python_host_prog = '/usr/bin/python'

