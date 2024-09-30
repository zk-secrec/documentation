---
api:
- module:
    "Integer"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Integral division, interpreting both given numbers as signed."
    effect:
      ""
    modifier:
      ""
    name:
      "div\\_signed"
    return:
      "uint\\[N\\] $pre @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Dividing the first given field element by the second one in the field."
    effect:
      "* -> * -> * ! <$S>"
    modifier:
      ""
    name:
      "divide\\_modulo"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> True iff the given two field elements are equal."
    effect:
      "* -> * -> * ! <$S>"
    modifier:
      ""
    name:
      "eq"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The greatest common divisor of the given two arguments which are interpreted as unsigned integers. Computing is based on Euclid's algorithm."
    effect:
      ""
    modifier:
      ""
    name:
      "gcd"
    return:
      "uint\\[N\\] $pre @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The reciprocal of the given field element."
    effect:
      ""
    modifier:
      ""
    name:
      "invert\\_modulo"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> True iff the given field element equals zero."
    effect:
      "* -> * ! <$S>"
    modifier:
      ""
    name:
      "is\\_zero"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint $pre @D"
    constraints:
    description:
      "> The floor of the binary logarithm of the given integer. Triggers assertion failure on non-positive arguments."
    effect:
      ""
    modifier:
      ""
    name:
      "log2"
    return:
      "uint $pre @D"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The larger of the given two integers in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "max\\_pre"
    return:
      "uint\\[N\\] $pre @D"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The smaller of the given two integers in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "min\\_pre"
    return:
      "uint\\[N\\] $pre @D"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> True iff the given two field elements are distinct."
    effect:
      ""
    modifier:
      ""
    name:
      "neq"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "a"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "m"
      type:
        "uint\\[M\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Raising a field element given as the first argument to the power of the second argument. The second argument is an integer in `$pre`. Computing uses the fast exponentiation algorithm."
    effect:
      "* -> * -> * ! <$S>"
    modifier:
      ""
    name:
      "pow\\_pre"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
    - "M : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "a"
      type:
        "uint $pre @D"
    - modifier:
        ""
      name:
        "m"
      type:
        "uint\\[M\\] $pre @public"
    constraints:
    description:
      "> Raising an unbounded integer given as the first argument to the power of the second argument. Both arguments are in `$pre`. Computing uses the fast exponentiation algorithm."
    effect:
      ""
    modifier:
      ""
    name:
      "pow\\_pre\\_inf"
    return:
      "uint $pre @D"
    typeArgs:
    - "@D"
    - "M : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    description:
      "> The square of the given integer."
    effect:
      ""
    modifier:
      ""
    name:
      "sqr"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint $pre @D"
    constraints:
    description:
      "> The floor of the square root of the given integer. Fails if the argument is negative. Computation is based on Newton's method."
    effect:
      ""
    modifier:
      ""
    name:
      "sqrt"
    return:
      "uint $pre @D"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Converting the given integer to boolean. Assumes that the argument is either 0 or 1."
    effect:
      "* -> * ! <$S>"
    modifier:
      ""
    name:
      "uint\\_to\\_bool"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
...
