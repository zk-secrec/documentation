---
api:
- module:
    "DFA"
- function:
    args:
    - modifier:
        ""
      name:
        "dfa"
      type:
        "DFA\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given DFA to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "dfa\\_to\\_pre"
    return:
      "DFA\\[N, $pre, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "dfa"
      type:
        "DFA\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given DFA to the domain `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "dfa\\_to\\_prover"
    return:
      "DFA\\[N, $S, @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "numStates"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "alphabetSize"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "trans"
      type:
        "list\\[list\\[uint\\[N\\] $S @D\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "init"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "finals"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> The DFA object with given fields."
    effect:
      ""
    modifier:
      ""
    name:
      "init\\_dfa"
    return:
      "DFA\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "dfa"
      type:
        "DFA\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "w"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the DFA given as the first argument recognizes the word given as the second argument."
    effect:
      "[*,*,[[*]],*,[*]] -> [*] -> * ! <@public>"
    modifier:
      ""
    name:
      "runDFA"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
