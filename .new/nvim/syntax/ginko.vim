" Language:   Ginko <https://maxadamski.com/ginko>
" Maintainer: Dariusz Max Adamski <max@maxadamski.com>
" URL:        http://github.com/maxadamski/vim-ginko
" License:    GPL

" Quit if the syntax file was already loaded.
if exists('b:current_syntax')
	finish
endif

" {{{ Comments
syn keyword ginkoTodo contained MARK NOTE TODO FIXME
hi def link ginkoTodo Todo

syn region ginkoComment start='#' end='\n' contains=ginkoTodo
syn region ginkoComment start='#=' end='=#' containedin=ginkoComment
hi def link ginkoComment Comment
" }}}

" {{{ Identifiers
"syntax match ginkoIdentifier /[[:alpha:]_][[:alnum:]_]*/
"highlight default link ginkoIdentifier Identifier
" }}}

" {{{ Keywords
syn keyword ginkoKeyword let var fun new del case where include alias for if else elif in
syn keyword ginkoKeyword enum struct protocol extend with use type
hi def link ginkoKeyword Keyword

syn keyword ginkoBoolean true false nil
hi def link ginkoBoolean Boolean
" }}}

" {{{ Label
syn match ginkoLabel /\<[[:alpha:]_][[:alnum:]_]*:\>/
syn match ginkoLabel /\<'[[:alpha:]_][[:alnum:]_]*\>/
"syn match ginkoLabel /\<_\>/
hi def link ginkoLabel Label

syn keyword ginkoIdentifier self super here it
"syn keyword ginkoIdentifier Int Float Double String
syn match ginkoIdentifier /\$[0-9]/
hi def link ginkoIdentifier Identifier
" }}}

" {{{ Delimiters
"syn keyword ginkoDelimiter in
"hi def link ginkoDelimiter Delimiter
"

" {{{ Literals
syn match ginkoNumber /\<[-+]\=\d\(\d\|_\)*\(\.\d\+\)\=\([eE][-+]\=\d\(\d\|_\)*\)\=\>/
syn match ginkoNumber /\<[-+]\=0b[01]\([01]\|_\)*\>/
syn match ginkoNumber /\<[-+]\=0o\o\(\o\|_\)*\>/
syn match ginkoNumber /\<[-+]\=0x\x\(\x\|_\)*\>/
hi def link ginkoNumber Number

syn match ginkoStringInterpolation contained /\\[\\abfnrtv'"?e]/
syn match ginkoStringInterpolation contained /\\U\x\{8}/
syn match ginkoStringInterpolation contained /\\u\x\{4}/
syn region ginkoString start='"' skip='\\"' end='"' contains=ginkoStringInterpolation
syn region ginkoString start='"""' end='"""' contains=ginkoStringInterpolation
hi def link ginkoString String

syn match ginkoRawStringInterpolation contained /\\"/
syn region ginkoRawString start='r"' skip='\\"' end='"' contains=ginkoRawStringInterpolation
hi def link ginkoRawString String
" }}}

" {{{ Operators
syntax keyword ginkoOperator / = - + ! * % < > & \| ^ ~ .
highlight default link ginkoOperator Operator
" }}}

let b:current_syntax = 'ginko'

