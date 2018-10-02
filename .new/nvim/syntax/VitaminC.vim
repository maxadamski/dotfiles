" Language:   Vitamin C <https://maxadamski.com/ginko>
" Maintainer: Max Adamski <max@maxadamski.com>
" URL:        http://github.com/maxadamski/vim-ginko
" License:    GPL

" Quit if the syntax file was already loaded.
if exists('b:current_syntax')
	finish
endif


" {{{ Comments
syn region  vComment start='//'  end='\n'  containedin=vComment
syn region  vComment start='/\*' end='\*/' containedin=vComment
hi def link vComment Comment

syn keyword vTodo MARK NOTE TODO FIXME containedin=vComment
hi def link vTodo Todo
" }}}


" {{{ Declaractions
syn region  vFunctionDecl start=/fun/ end=/{/
syn match   vFunctionName /[[:alpha:]_][[:alnum:]_]*\s*\((\)\@=/ containedin=vFunctionDecl
hi def link vFunctionName Function

syn match   vType /\(:\|->\)\@<=\s*[[:alpha:]_][[:alnum:]_]*/ containedin=vFunctionDecl
hi def link vType Type

" }}}


" {{{ Keywords
syn keyword vKeyword def while if else
hi def link vKeyword Keyword

syn keyword vConstant true false nil
hi def link vConstant Number
" }}}


" {{{ Numbers
syn match   vNumber /\<[-+]\=\d\(\d\|_\)*\(\.\d\+\)\=\([eE][-+]\=\d\(\d\|_\)*\)\=\>/
syn match   vNumber /\<[-+]\=0b[01]\([01]\|_\)*\>/
syn match   vNumber /\<[-+]\=0o\o\(\o\|_\)*\>/
syn match   vNumber /\<[-+]\=0x\x\(\x\|_\)*\>/
hi def link vNumber Number
" }}}


" {{{ Functions
syn region  vLambdaCall start=/[[:alpha:]_][[:alnum:]_]*(/ end=/)/

syn match   vLambdaName /[[:alpha:]_][[:alnum:]_]*\((\)\@=/ containedin=vLambdaCall
hi def link vLambdaName Function
" }}}


" {{{ Directives
syn match   vPragmaCall /#[[:alpha:]_][[:alnum:]_]*\(\s\|\n\|\r\)\+/
syn region  vPragmaCall start=/#[[:alpha:]_][[:alnum:]_]*(/ end=/)/
syn match   vPragmaName /#[[:alpha:]_][[:alnum:]_]*/ containedin=vPragmaCall
hi def link vPragmaName PreProc
" }}}


" {{{ Annotations
syn match   vAnnotation /@[[:alpha:]_][[:alnum:]_]*\(\s\|\n\|\r\)\+/
syn region  vAnnotation start=/@[[:alpha:]_][[:alnum:]_]*(/ end=/)/
syn match   vAnnotName /@[[:alpha:]_][[:alnum:]_]*/ containedin=vAnnotation
hi def link vAnnotName Special
" }}}


" {{{ Strings
syn match   vStringInterpolation /\\[\\abfnrtv'"?e]/
syn match   vStringInterpolation /\\U\x\{8}/
syn match   vStringInterpolation /\\u\x\{4}/
hi def link vStringInterpolation Special

syn region  vString start='"' skip='\\"' end='"' contains=vStringInterpolation
syn region  vString start='"""' end='"""' contains=vStringInterpolation
hi def link vString String

syn match   vRawStringInterpolation contained /\\"/
syn region  vRawString start='r"' skip='\\"' end='"' contains=vRawStringInterpolation
hi def link vRawString String
" }}}

let b:current_syntax = 'VitaminC'
