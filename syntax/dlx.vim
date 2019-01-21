" Regexes for the various syntax elements

" Syntax groups based on regex
syntax match dlxComment  '/.*$'
syntax match dlxRegister '[rR][0-9]\{2}'
syntax match dlxLiteral  '#[0-9]*'
syntax match dlxDisplace '[0-9]\{1,4}([rR][0-9]\{2})'
syntax match dlxLabel	 '\<[a-zA-Z]\+\>:\='

" Syntax groups for Opcodes
syntax case ignore
syntax match dlxOpcode 'ADD'
syntax match dlxOpcode 'ADDI'
syntax keyword dlxOpcode 'ANDI'
syntax keyword dlxOpcode 'AND'
syntax keyword dlxOpcode 'ORI'
syntax keyword dlxOpcode 'OR'
syntax keyword dlxOpcode 'SEQI'
syntax keyword dlxOpcode 'SEQ'
syntax keyword dlxOpcode 'SLEI'
syntax keyword dlxOpcode 'SLE'
syntax keyword dlxOpcode 'SLLI'
syntax keyword dlxOpcode 'SLL'
syntax keyword dlxOpcode 'SLTI'
syntax keyword dlxOpcode 'SLT'
syntax keyword dlxOpcode 'SNEI'
syntax keyword dlxOpcode 'SNE'
syntax keyword dlxOpcode 'SRAI'
syntax keyword dlxOpcode 'SRA'
syntax keyword dlxOpcode 'SRLI'
syntax keyword dlxOpcode 'SRL'
syntax keyword dlxOpcode 'SUBI'
syntax keyword dlxOpcode 'SUB'
syntax keyword dlxOpcode 'XORI'
syntax keyword dlxOpcode 'XOR'
syntax keyword dlxOpcode 'BEQZ'
syntax keyword dlxOpcode 'BNEZ'
syntax keyword dlxOpcode 'J'
syntax keyword dlxOpcode 'JALR'
syntax keyword dlxOpcode 'JAL'
syntax keyword dlxOpcode 'JR'
syntax keyword dlxOpcode 'LW'
syntax keyword dlxOpcode 'SW'
syntax keyword dlxOpcode 'HALT'
syntax keyword dlxOpcode 'TRAP'
syntax keyword dlxOpcode 'MULT'
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

