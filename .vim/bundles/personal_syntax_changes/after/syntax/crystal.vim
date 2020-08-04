hi link crystalRegexpAnchor         Function
hi link crystalRegexpCharClass      Function
hi link crystalRegexpQuantifier     Function
hi link crystalRegexpEscape         Function

hi link crystalSymbol               Number
hi link crystalEscape               Number

hi link crystalInclude              Operator
hi link crystalControl              Operator
hi link crystalOperator             Operator
hi link crystalException            Operator

hi link crystalStringDelimiter      String

if hlexists('GenericConstant')
  hi link crystalConstant           GenericConstant
endif

if hlexists('GenericInstanceVariable')
  hi link crystalInstanceVariable   GenericInstanceVariable
  hi link crystalBlockParameter     GenericInstanceVariable
  hi link crystalClassVariable      GenericInstanceVariable
  hi link crystalGlobalVariable     GenericInstanceVariable
  hi link crystalPseudoVariable     GenericInstanceVariable
endif

if hlexists('GenericInterpolation')
  hi link crystalInterpolation      GenericInterpolation
  hi link crystalInterpolationDelim GenericInterpolation
endif

if hlexists('GenericRegexp')
  hi link crystalRegexp             GenericRegexp
  hi link crystalRegexpDelimiter    GenericRegexp
  hi link crystalRegexpSpecial      GenericRegexp
endif
