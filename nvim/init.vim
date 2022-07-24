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

nmap <silent> s <Plug>(leap-forward)
nmap <silent> S <Plug>(leap-backward)

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope gradle<cr>

nmap <silent> <leader>q <cmd>bp<bar>sp<bar>bn<bar>bd<cr>

nnoremap <leader>g <cmd>Neogit kind=vsplit<cr>

nnoremap <silent> zs <cmd>term zsh<cr>a

" }}}
" -------------------------------------------------------
" {{{ Vim Plug

        call plug#begin('~/.config/nvim/plugged')

                " {{{ Utilities
                        " {{{ Keybinds
                        Plug 'tpope/vim-commentary'
                        Plug 'tpope/vim-surround'
                        Plug 'tpope/vim-sensible'
                        Plug 'tpope/vim-vinegar'
                        Plug 'tpope/vim-unimpaired'
                        " }}}
                        
                        " {{{ Extra Functionality
                        Plug 'nvim-telescope/telescope.nvim'
                        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
                        Plug 'nvim-telescope/telescope-frecency.nvim'
                        Plug 'aloussase/telescope-gradle.nvim'
                        Plug 'ggandor/leap.nvim' 
                        Plug 'TimUntersberger/neogit'
                        Plug 'tpope/vim-vinegar'
                        Plug 'mbbill/undotree'
                        " }}}

                Plug 'junegunn/vim-plug'
                Plug 'nvim-lua/plenary.nvim'
                Plug 'lewis6991/impatient.nvim'
                Plug 'tami5/sqlite.lua'
                Plug 'jiangmiao/auto-pairs'
                " }}}
                
                " {{{ Language Server
                Plug 'neovim/nvim-lspconfig'
                Plug 'hrsh7th/cmp-nvim-lsp'
                Plug 'hrsh7th/cmp-buffer'
                Plug 'hrsh7th/cmp-path'
                Plug 'hrsh7th/cmp-cmdline'
                Plug 'hrsh7th/nvim-cmp'
                Plug 'tami5/lspsaga.nvim'
                Plug 'hrsh7th/vim-vsnip'
                Plug 'hrsh7th/vim-vsnip-integ'
               " }}}
               
               " {{{ Language Specific
               Plug 'Saecki/crates.nvim'
               Plug 'preservim/vim-markdown'
               Plug 'vimwiki/vimwiki', { 'for': 'vimwiki' }
               Plug 'nvim-orgmode/orgmode'
               " }}}

                " {{{ Aesthetics
                Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
                Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
                Plug 'nvim-lualine/lualine.nvim'
                Plug 'kdheepak/tabline.nvim'
                Plug 'kyazdani42/nvim-web-devicons'
                Plug 'glepnir/dashboard-nvim'
                Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
                Plug 'onsails/lspkind.nvim'
                Plug 'lukas-reineke/headlines.nvim'
                " }}}
                
                " {{{ ColorSchemes
                Plug 'shaunsingh/nord.nvim'
                Plug 'tanvirtin/monokai.nvim'
                " }}}

        call plug#end()
        
        " {{{ Vim Plug Commands
        set termguicolors
        colorscheme nord
        set background=dark

        lua require('crates').setup()
        lua require('headlines').setup()
        lua require('impatient').enable_profile()
        lua require('orgmode').setup_ts_grammar()

        " }}}

" }}}
" -------------------------------------------------------
" {{{ Variables

let g:python3_host_prog = '/opt/homebrew/bin/python3'

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set guifont=JetBrainsMono_Nerd_Font_Mono:h13

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

" }}}
" -------------------------------------------------------
" {{{ Functions

function! GitBranch()
        return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" }}}
" -------------------------------------------------------
" {{{ Goyo and Limelight

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\n' " '^\s'
let g:limelight_eop = '^\n' " '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}
" --------------------------------------------------------
"  {{{ Statusline

lua << END
local get_color = require'lualine.utils.utils'.extract_highlight_colors

require('lualine').setup {
        options = {
                icons_enabled = true,
                theme = 'nord',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                diabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = false,
                },
        sections = {
                lualine_a = {'mode', 'location'},
                lualine_b = {'filetype'},
                lualine_c = {
                        {
                        'filename',
                        file_status = true,
                        path = 1,
                        shorting_target = 40
                        }},
                lualine_x = {'progress'},
                lualine_y = {'branch', 'diff'},
                lualine_z = {
                        {
                        'diagnostics',
                        sources = {'nvim_diagnostic'},
                        sections = {'error', 'warn', 'info', 'hint'},
                        symbols = {error = '', warn = '', info = '', hint = ''},
                        
                        diagnostics_color = {
                                error = { fg = get_color('DiagnosticsError', 'fg')},
                                warn = { fg = get_color('DiagnosticsWarn', 'fg')},
                                info = { fg = get_color('DiagnosticsInfo', 'fg')},
                                hint = { fg = get_color('DiagnosticsHint', 'fg')},
                                },

                        colored = false,
                        update_in_insert = false,
                        always_visible = true,
                        }},

                },
        inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location', 'progress'},
                lualine_y = {},
                lualine_z = {},
                },
        tabline = {},
        }

require'tabline'.setup {
        enable = true,
        options = {
                show_tabs_always = false,
                show_devicons = false,
                show_bufnr = false,
                show_filename_only = true,
                modified_icon = "+",
                modified_italic = false,
                show_tabs_only = false,
                }
        }
END

" }}}
" --------------------------------------------------------
" {{{ Lspconfig

lua << END
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require'lspconfig'.elixirls.setup {
        cmd = { "elixir-ls" },
        on_attach = on_attach,
        flags = {
                debounce_text_changes = 150,
                },
        elixirLS = {
                dialyzerEnabled = false,
                fetchdeps = false,
                };
        }


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'rust_analyzer',
                'crystalline',
                'kotlin_language_server',
                'elixirls',
                'sumneko_lua',
                'ccls'
        } 
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

END

" }}}
" -------------------------------------------------------
" {{{ Nvim-cmp

lua << END
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        preset = 'codicons',
        maxwidth = 50,
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
        },
        before = function (entry, vim_item)
          return vim_item
          end
          })
    },      
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
--      completion = cmp.config.window.bordered(),
--      documentation = cmp.config.window.bordered(),
--        completion = cmp.config.window.bordered({
--          winhighlight = 'Normal:Directory,NormalNC:CmpItemMenu'
--        }),
--        documentation = cmp.config.window.bordered({
--          winhighlight = 'Normal:Directory,NormalNC:CmpItemMenu'
--        }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'orgmode' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = {'rust_analyzer',
                'crystalline',
                'elixirls',
                'kotlin_language_server',
                'sumneko_lua',
                'ccls'
        }
  for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
      capabilities = capabilities
    }
  end
END

" }}}
" -------------------------------------------------------
" {{{ Lspsaga

lua << END
local saga = require 'lspsaga'

saga.setup {
        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',
        border_style = "round",
        code_action_prompt = {
                enable = false,
                },
        }
END

nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> <leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>

" }}}
" -------------------------------------------------------
" {{{ Nvim-treesitter

lua << END
require'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "toml", "kotlin", "elixir", "lua", "vim", "org" },
        sync_install = false,
        ignore_install = { "javascript" },
        highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = {"org"},
                },
        incremental_selection = {
                enable = true,
                keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                        },
                },
        }
END

" }}}
" -------------------------------------------------------
" {{{ Dashboard
lua << END
local dash = require('dashboard')

-- dash.preview_command = "awk '{ printf \"\033[35m%s\", $0 }'" 
-- dash.preview_command = 'awk \'{ printf "\033[35m%s\n", '
dash.preview_command = 'cat | lolcat -F 0.03 -s 90 -p 2 -a -d 2'
dash.preview_file_path = '~/.config/nvim/dashboard_header.txt'
dash.preview_file_height = 20
dash.preview_file_width = 80

dash.custom_center = {
        { desc = "Find files", action = "Telescope find_files" },
        { desc = "File Browser", action = "Telescope file_browser" },
        { desc = "Find word", action = "Telescope live_grep" }
        }
END


" }}}
" -------------------------------------------------------
" {{{ Telescope

lua << END
local telescope = require('telescope')

telescope.setup({
defaults = {
        layout_config = {
                vertical = { width = 0.5 }
                },
        preview = false,
        },
pickers = {
        find_files = {
                theme = "dropdown",
                },
        live_grep = {
                theme = "dropdown",
                }
        },
})

telescope.load_extension('fzf')
telescope.load_extension('gradle')
telescope.load_extension('frecency')
END

" }}}
" -------------------------------------------------------
" {{{ Misc Lua Configs


lua << END
require('orgmode').setup({
        org_agenda_files = {'~/Documents/**/*'},
        org_indent_mode = "noindent",
})

require('headlines').setup({
markdown = { 
        fat_headlines = false,
        headline_highlights = {
                "Headline1",
                "Headline2",
                "Headline3",
                "Headline4",
                "Headline5",
                "Headline6",
                },
        },
org = { 
        fat_headlines = false,
        headline_highlights = {
                "Headline1",
                "Headline2",
                "Headline3",
                "Headline4",
                "Headline5",
                "Headline6",
                },
        },
norg = { 
        fat_headlines = false,
        headline_highlights = {
                "Headline1",
                "Headline2",
                "Headline3",
                "Headline4",
                "Headline5",
                "Headline6",
                },
        }
})
END
