" Vim syntax file
" Language:    NSL
" Maintainer:  KISHIMOTO, Makoto <ksmakoto@dd.iij4u.or.jp>
" Last Change: 2012 Jan 24
" URL:         https://github.com/metanest/nsl_vim
" Filenames:   *.nsl
" Version:     0.3

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax keyword nslStructure module declare state interface
syntax keyword nslStatement if any alt seq proc else
syntax keyword nslType state_name input output func_in inout func
syntax keyword nslType func_out func_self reg wire mem
syntax keyword nslStatement goto return invoke finish
syntax match nslInclude "#include"
syntax match nslDefine "#define"
syntax match nslOperator "\^"
syntax match nslOperator "&"
syntax match nslOperator "|"
syntax match nslOperator "=="
syntax match nslOperator ":"
syntax match nslOperator "="
syntax match nslOperator "+"
syntax match nslOperator "-"
syntax match nslOperator "\*"

syntax match nslComment "//.*"
" syntax match Purple "[{}<>().,;]"
syntax match nslIdentifier "[a-z_][a-zA-Z0-9_]*"
syntax match nslConstant "\<[A-Z][A-Z0-9_]*\>\C"

" syntax match Red    "0\+[1-7]\=[\t\n$,; ]" " what's this ?
syntax match nslNumber "[0-9]\d*"
syntax match nslNumber "0[oO][0-7]\+" "hs=s+2
syntax match nslNumber "0[xX][0-9a-fA-F]\+" "hs=s+2
syntax match nslNumber "0[bB][0-1]*" "hs=s+2

syntax region nslComment start="/\*" end="\*/"
syntax region nslString start="\"" end="\""

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_nsl_syntax_inits")
  if version < 508
    let did_nsl_syntax_inits = 1
    command -nargs=+ HiLink highlight link <args>
  else
    command -nargs=+ HiLink highlight def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink nslStructure Structure
  HiLink nslStatement Statement
  HiLink nslType Type
  HiLink nslInclude Include
  HiLink nslDefine Define
  HiLink nslOperator Operator
  HiLink nslComment Comment
  " HiLink nslIdentifier Identifier " Dont highlight identifier
  HiLink nslConstant Constant
  HiLink nslNumber Number
  HiLink nslString String

  delcommand HiLink
endif

let b:current_syntax = "nsl"

" vim: ts=8
