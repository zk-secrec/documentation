---
api:
- module:
    "Char"
- function:
    args:
    - modifier:
        ""
      name:
        "chr"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the given integer is an ASCII code of a digit character."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_digit\\_chr"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
