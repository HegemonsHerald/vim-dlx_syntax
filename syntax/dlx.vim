" Regexes for the various syntax elements

" Syntax groups based on regex
syntax match dlxComment  '/.*$'
syntax match dlxRegister '[rR][0-9]\{2}'
syntax match dlxLiteral  '#[0-9]*'
syntax match dlxDisplace '[0-9]\{1,4}([rR][0-9]\{2})'
syntax match dlxLabel	 '\<[a-zA-Z]\+\>:\='

" Syntax groups for Opcodes
syntax case ignore
syntax keyword dlxOpcode OR[I]
syntax keyword dlxOpcode ADD[I]
syntax keyword dlxOpcode AND[I]
syntax keyword dlxOpcode SEQ[I]
syntax keyword dlxOpcode SLE[I]
syntax keyword dlxOpcode SLL[I]
syntax keyword dlxOpcode SLT[I]
syntax keyword dlxOpcode SNE[I]
syntax keyword dlxOpcode SRA[I]
syntax keyword dlxOpcode SRL[I]
syntax keyword dlxOpcode SUB[I]
syntax keyword dlxOpcode XOR[I]
syntax keyword dlxOpcode JAL[R]
syntax keyword dlxOpcode J[R]
syntax keyword dlxOpcode BEQZ
syntax keyword dlxOpcode BNEZ
syntax keyword dlxOpcode LW
syntax keyword dlxOpcode SW
syntax keyword dlxOpcode HALT
syntax keyword dlxOpcode TRAP
syntax keyword dlxOpcode MULT
syntax case match

" Linking groups to existing hi-groups
" highlight link dlxComment	Comment
" highlight link dlxLiteral	Function
" highlight link dlxDisplace	Number
" highlight link dlxOpcode	Statement
" highlight dlxRegister	ctermfg=208 guifg=#fd971f
" highlight link dlxLabel Identifier

" Highlighting with colors that come closest to Hűser's Dark Theme
highlight link dlxComment	Comment
highlight dlxLabel	ctermfg=39
highlight dlxOpcode	ctermfg=197
highlight dlxRegister	ctermfg=214
highlight dlxLiteral	ctermfg=154
highlight dlxDisplace	ctermfg=217




" This stuff doesn't have anything to do with dlx, I was just playing around
" with lookarounds in vim's regex syntax... Try typing:
"
" 	for (sth) for (sth) while (sth)
"

" in:
"   for (expr1) while (expr2)
" match expr1
"
" \(for (\)\@<=		match right after 'for ('
" \() while (\)\@=	match ') while (' zero-width
"
" The \@= is used to specify, that a 'while' has to
" follow the expr1 part.
"
" Unlike \= \@= has to match, the match just doesn't
" affect the captured chars.
syntax match dlxX '\(for (\)\@<=\w\+\() while (\)\@='
highlight link dlxX SpellBad

