hi semshiLocal      ctermfg=209 guifg=#ff875f
hi semshiGlobal     ctermfg=214 guifg=#ffaf00
hi semshiImported   ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter  ctermfg=75  guifg=#5fafff
hi semshiFree       ctermfg=218 guifg=#ffafd7
hi semshiBuiltin    ctermfg=207 guifg=#ff5fff
hi semshiAttribute  ctermfg=49  guifg=#00ffaf
hi semshiSelf       ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected   ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f


hi semshiError ctermfg=white ctermbg=160
sign define semshiError text=E> texthl=semshiError


if !exists('g:semshi#active')
    let g:semshi#active = 1
endif

if !exists('g:semshi#excluded_hl_groups')
    let g:semshi#excluded_hl_groups = ['local']
endif

if !exists('g:semshi#mark_original_node')
    let g:semshi#mark_original_node = 0
endif

if !exists('g:semshi#no_default_builtin_highlight')
    let g:semshi#no_default_builtin_highlight = 1
endif

if !exists('g:semshi#simplify_markup')
    let g:semshi#simplify_markup = 1
endif

function! s:remove_builtin_extra()
    syn keyword pythonKeyword True False None
    hi link pythonKeyword pythonNumber
endfunction

if g:semshi#no_default_builtin_highlight
    autocmd FileType python call s:remove_builtin_extra()
    let g:python_no_builtin_highlight = 1
    hi link pythonBuiltin NONE
    let g:python_no_exception_highlight = 1
    hi link pythonExceptions NONE
    hi link pythonAttribute NONE
    hi link pythonDecoratorName NONE

    "For python-syntax
    let g:python_highlight_class_vars = 0
    let g:python_highlight_builtins = 0
    let g:python_highlight_exceptions = 0
    hi link pythonDottedName NONE
endif

function! s:simplify_markup()
    hi link pythonConditional pythonStatement
    hi link pythonImport pythonStatement
    hi link pythonInclude pythonStatement
    hi link pythonRaiseFromStatement pythonStatement
    hi link pythonDecorator pythonStatement
    hi link pythonException pythonStatement
    hi link pythonConditional pythonStatement
    hi link pythonRepeat pythonStatement

    "For python-syntax
    let g:python_highlight_operators = 0
endfunction

if g:semshi#simplify_markup
    autocmd FileType python call s:simplify_markup()
endif
