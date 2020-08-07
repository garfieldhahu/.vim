""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即<Leader>
let mapleader = ","
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 不让vim发出讨厌的滴滴声
set noerrorbells
" 不要使用vi的键盘模式，使用vim自己的
set nocompatible
" 去掉输入错误的提示
" set noeb
" 告诉我们文件的哪一行被改变过
set report=0
" 可以在buffer的任何地方使用鼠标
" set mouse=a
set selection=exclusive
set selectmode=mouse,key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法高亮功能
syntax enable
" 允许指定语法高亮配色方案替换默认方案
syntax on
" 开启256色支持，默认是8色
set t_Co=256
" 命令行显示输入的命令
set showcmd         
" 命令行的高度
set cmdheight=2
" 命令行显示vim当前模式
set showmode
" 总是显示状态栏
set laststatus=2
" 开启行号显示
set nu
set rnu
" 显示光标当前位置
set ruler           
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 用浅色高亮当前行
" autocmd InsertEnter * se cul    
" 禁止显示菜单和工具条
set guioptions-=T           
set guioptions-=m           
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 字符间插入的像素行数目
set linespace=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行的距离
set scrolloff=3
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 允许光标出现在最后一个字符的后面
" set virtualedit=block,onemore   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置自动缩进
set autoindent
" 设置使用C/C++语言的自动缩进方式
set cindent
" 设置C/C++语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能的选择对其方式
set smartindent
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4
" 在行和段开始处使用制表符
set smarttab
" 历史文件中需要记录的行数
set history=1000
" 禁止折行
" set nowrap
" 使用回格键正常处理indent,eol,start等
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示搜索结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 设置魔术
set magic                   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim自身命名行模式智能补全
set wildmenu
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁止生成临时文件
set nobackup
set noswapfile
" 文件在vim之外修改过，自动重新读入
set autoread
" 设置自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
" 帮助系统设置为中文
set helplang=cn
" 设置编码格式
set termencoding=utf-8
set encoding=utf8
" 使用utf-8或gbk打开文件
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" set textwidth=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.cc,*.c,*.hpp,*.h,*.sh,*.py exec ":call SetTitle()" 
func SetTitle() 
    if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    elseif expand("%:e") == 'cpp'
        call setline(1,"#include <iostream>") 
        call append(line("."), "") 
    elseif expand("%:e") == 'cc'
        call setline(1,"#include <iostream>") 
        call append(line("."), "") 
    elseif expand("%:e") == 'c'
        call setline(1,"#include <stdio.h>") 
        call append(line("."), "") 
    elseif expand("%:e") == 'h'
        call setline(1, "#pragma once")
    elseif expand("%:e") == 'hpp'
        call setline(1, "#pragma once")
    endif
endfunc 
autocmd BufNewFile * normal G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'vim-scripts/vim-plug'
Plug 'vim-scripts/a.vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/LeaderF', {'do': '.\install.bat'}
Plug 'tpope/vim-fugitive'
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --go-completer'}
Plug 'easymotion/vim-easymotion'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-smooth-scroll'
Plug 'rking/ag.vim'
Plug 'itchyny/vim-cursorword'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>n :NERDTreeToggle<CR>
inoremap <Leader>n <ESC> :NERDTreeToggle<CR>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

map <Leader>w <C-W><C-W>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ag_working_path_mode="r"
nnoremap <Leader>a :Ag!<Space>


" YCM
let g:ycm_confirm_extra_conf = 0 
let g:ycm_error_symbol = '<<'
let g:ycm_warning_symbol = '<'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1 
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>i :YcmCompleter GoToDefinition<cr> 
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap<leader>f :YcmCompleter FixIt<CR>
nmap <F5> :YcmDiags<cr>

" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags
set tags+=./.tags;,.tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_whitelist = {'h': 1, 'hh': 1, 'cc': 1, 'cpp': 1, "go": 1}
let g:ycm_semantic_triggers =  {
  \   'c' : ['re!\w{2}'],
  \   'cpp,python,go' : ['re!\w{2}'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \ }


" colorscheme
set background=dark
let g:solarized_termcolors=256
colorscheme onedark



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="onedark"
" let g:airline_theme="badwolf"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '|'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = '|'
let g:airline_symbols.readonly = '|'
let g:airline_symbols.linenr = '|'
let g:airline_symbols.maxlinenr = '|'


" vim-devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12


" indentLine
let g:indentLine_enabled=0
nmap <Leader><Leader>il :IndentLinesToggle<CR>

" Leaderf
nnoremap <leader>lr :LeaderfMru<CR>
nnoremap <leader>lm :LeaderfFunction<CR>
nnoremap <leader>lf :LeaderfFile<CR>
nnoremap <leader>llf :LeaderfFile<Space>
nnoremap <leader>lb :LeaderfBuffer<CR>
nnoremap <leader>lt :LeaderfTag<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

nmap <C-]> g]

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

let g:rainbow_active=1
