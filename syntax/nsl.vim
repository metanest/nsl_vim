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

syntax keyword nslStructure module declare state interface simulation
syntax keyword nslStatement if any alt seq proc else while for generate
syntax keyword nslStatement goto return invoke finish
syntax keyword nslType state_name label_name proc_name input output inout
syntax keyword nslType func func_in func_out func_self reg wire mem
syntax keyword nslType integer variable
syntax keyword nslType param_int param_str
syntax match nslInclude "#include"
syntax match nslDefine "#define"
syntax match nslDefine "#\(ifndef\|ifdef\|else\|undef\)"
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
syntax match nslNumber "[0-9]*'b[01]*"
syntax match nslNumber "[0-9]*'h[0-9a-f]*"
syntax match nslNumber "[0-9]*'d[0-9]*"
syntax match nslNumber "[0-9]*'o[0-7]*"
syntax match nslSpecial "\(_display\|_finish\|_monitor\|_random\)"
syntax match nslSpecial "\(_readmemb\|_readmemh\|_time\)"
syntax match nslSpecial "\(_init|_delay\)"

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
  HiLink nslSpecial Special

  delcommand HiLink
endif

let b:current_syntax = "nsl"
