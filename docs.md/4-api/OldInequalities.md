---
api:
- module:
    "OldInequalities"
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
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number in the first argument is greater than or equal to the number in the second argument. The third argument provides a common length of the binary representation that is used if the numbers are in `$post` `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "ge"
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
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number with little-endian binary representation in the first argument is greater than or equal to the number with little-endian binary representation in the second argument. The third argument provides the common length of the representations (the actual lists can be longer but the remaining parts are not read)."
    effect:
      ""
    modifier:
      ""
    name:
      "ge'"
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
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number in the first argument is greater than the number in the second argument. The third argument provides a common length of the binary representation that is used if the numbers are in `$post` `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "gt"
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
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number with little-endian binary representation in the first argument is greater than the number with little-endian binary representation in the second argument. The third argument provides the common length of the representations (the actual lists can be longer but the remaining parts are not read)."
    effect:
      ""
    modifier:
      ""
    name:
      "gt'"
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
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number in the first argument is less than or equal to the number in the second argument. The third argument provides a common length of the binary representation that is used if the numbers are in `$post` `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "le"
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
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number with little-endian binary representation in the first argument is less than or equal to the number with little-endian binary representation in the second argument. The third argument provides the common length of the representations (the actual lists can be longer but the remaining parts are not read)."
    effect:
      ""
    modifier:
      ""
    name:
      "le'"
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
        "xb"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yb"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number with little-endian binary representation in the first argument is less than the number with little-endian binary representation in the second argument. The third argument provides the common length of the representations (the actual lists can be longer but the remaining parts are not read)."
    effect:
      ""
    modifier:
      ""
    name:
      "less\\_than"
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
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number in the first argument is less than the number in the second argument. The third argument provides a common length of the binary representation that is used if the numbers are in `$post` `@prover`."
    effect:
      "* -> * -> * -> * ! <$S>"
    modifier:
      ""
    name:
      "lt"
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
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the number with little-endian binary representation in the first argument is less than the number with little-endian binary representation in the second argument. The third argument provides the common length of the representations (the actual lists can be longer but the remaining parts are not read). Synonym of `less_than`."
    effect:
      ""
    modifier:
      ""
    name:
      "lt'"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
...
