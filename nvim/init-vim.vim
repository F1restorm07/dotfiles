" {{{ System Config

syntax enable " enables syntax highlighting
set t_Co=256 " extend the terminal color palette
set t_ut= " diable background color erase
set nocompatible " make vim more or less vi-compatible

set visualbell " use visual bell instead of beeping
set ruler " display cursor position on last line of screen
set t_vb= " reset terminal code for visual bell --visualbell must be set--

set mouse=a " allow use of mouse for all modes

set confirm " instead of failing a command becasue of unsaved changes, ask if you want to save the file first

" set tabstop=2 " length of tab --characters--
set softtabstop=2 " length of tabstop --spaces--
set expandtab

set smartindent " auto indent

set nowrap " disables text wrapping

set number " enable line numbers

set showcmd " show partial commands in status line
set laststatus=2 " always display status line

set cursorline " highlight current line

filetype indent on " indent based on filetype
filetype plugin on " enable filetype-specific plugins

set wildmenu " better command-line completion
set wildoptions+=pum " make wildmenu vertical

set lazyredraw " redraw only when you need to

set showmatch " show matching brackets

set incsearch " incremental searching in status line
" set hlsearch " highlight matching search patterns

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker

set noswapfile " disables swap file
set nobackup " disables backup file
set undodir=~/.config/nvim/undodir " path to undo directory
set undofile " enbles undo file

set colorcolumn=100 " display a ruler at the right side of screen

set completeopt=menu,menuone,noselect

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" }}}
" -------------------------------------------------------
" {{{ System Mappings

nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap gV `[v`]

let mapleader=","

inoremap jk <esc>
tnoremap <esc> <C-\><C-n>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <silent> zs <cmd>term zsh<cr>a

nnoremap <leader>g <cmd>Neogit kind=vsplit<cr>

nnoremap <silent> ta <cmd>tabnew<cr>
nnoremap <silent> tc <cmd>tabclose<cr>
nnoremap <silent> tn <cmd>tabn<cr>
nnoremap <silent> tp <cmd>tabp<cr>

nnoremap <silent> - <cmd>lua require("lir.float").init()<cr>

nnoremap <leader>zn :TZNarrow<cr>
vnoremap <leader>zn :'<,'>TZNarrow<cr>
nnoremap <leader>zf :TZFocus<cr>
nnoremap <leader>zm :TZMinimalist<cr>
nnoremap <leader>za :TZAtaraxis<cr>

nnoremap <silent> gh :Lspsaga lsp_finder<cr>

nnoremap <silent> <leader>ca :Lspsaga code_action<cr>
vnoremap <silent> <leader>ca :Lspsaga range_code_action<cr>

nnoremap <silent> gr :Lspsaga rename<cr>

nnoremap <silent> gd :Lspsaga preview_definition<cr>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<cr>
nnoremap <silent> <leader>cd :Lspsaga show_cursor_diagnostics<cr>

nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<cr>
nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<cr>

nnoremap <silent> ]D lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
nnoremap <silent> [D lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })

nnoremap <silent> <leader>o :LSoutlineToggle<cr>

nnoremap <silent> K :Lspsaga hover_doc<cr>

nnoremap <silent> <C-f> lua require('lspsaga.action').smart_scroll_with_saga(1)
nnoremap <silent> <C-b> lua require('lspsaga.action').smart_scroll_with_saga(-1)
" }}}
" -------------------------------------------------------
" {{{ Plugin Setup Commands

lua require('impatient').enable_profile()

lua vim.notify = require('notify')

set termguicolors
colorscheme nord
set background=dark


runtime! lua/**.lua

" }}}
" -------------------------------------------------------
" {{{ Variables

let g:python3_host_prog = '/opt/homebrew/bin/python3'
let loaded_netrwPlugin = 1

set guifont=JetBrainsMono_Nerd_Font_Mono:h13
set sessionoptions+=winpos,terminal,folds

let g:neovide_cursor_vfx_mode = "wireframe"
let g:neovide_cursor_vfx_opacity = 200.0
let g:neovide_cursor_vfx_particle_lifetime = 0.5
let g:neovide_cursor_vfx_particle_speed = 10.0
let g:neovide_cursor_animation_length = 0.05
let g:neovide_cursor_trail_length = 0.2
let g:neovide_cursor_unfocused_outline_width = 0.125

" }}}
" -------------------------------------------------------
" {{{ Highlights

hi Headline guifg=#88c0d0 guibg=#3b4252 gui=bold
hi link Headline1 Headline
hi link Headline2 Headline
hi link Headline3 Headline
hi link Headline4 Headline
hi link Headline5 Headline
hi link Headline6 Headline

" sign define LspDiagnosticsWarn text=u texthl=LspDiagnosticsWarn linehl= numhl=


" }}}
" -------------------------------------------------------
" {{{ Functions

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

autocmd BufRead,BufNewFile *.wgsl set filetype=wgsl

" }}}
" -------------------------------------------------------
" {{{ Dashboard

lua << END
local dash = require('dashboard')

dash.preview_command = 'cat | lolcat -F 0.03 -s 90 -p 2 -a -d 2'
dash.preview_file_path = '~/.config/nvim/headers/planet.txt'
dash.preview_file_height = 20
dash.preview_file_width = 80

dash.custom_center = {
        { desc = "Find files", action = "Telescope find_files" },
        { desc = "Open previous session", action = "Autosession search" },
        { desc = "Find word", action = "Telescope live_grep" }
}
END

" }}}
" -------------------------------------------------------
" {{{ Misc Lua Configs

lua << END
vim.g.override_nvim_web_devicons = true
END
