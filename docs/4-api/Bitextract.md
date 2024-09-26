---
api:
- module:
    "Bitextract"
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
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Little-endian binary representation of the integer given as the first argument, using the number of digits given as the second argument. If this number of digits is not enough, the digits of higher units are omitted."
    effect:
      "* -> * -> [*] ! <$S>"
    modifier:
      ""
    name:
      "bitextract"
    return:
      "list\\[bool\\[N\\] $S @D\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The list of little-endian binary representations of all elements of the given list, using always the number of digits given as the second argument. If this number of digits is not enough, the digits of higher units are omitted. Equivalent to applying `bitextract` to every element of the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "bitextract\\_list"
    return:
      "list\\[list\\[bool\\[N\\] $post @D\\] $pre @public\\] $pre @public"
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
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Little-endian binary representation of the integer in the stage `$pre` given as the first argument, using the number of digits given as the second argument. If this number of digits is not enough, the digits of higher units are omitted."
    effect:
      ""
    modifier:
      ""
    name:
      "bitextract\\_pre"
    return:
      "list\\[bool\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "bits"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The integer whose little-endian binary representation is given."
    effect:
      ""
    modifier:
      ""
    name:
      "bits\\_to\\_uint"
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
        "bytes"
      type:
        "list\\[list\\[bool\\[N\\] $S @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The list of integers whose little-endian binary representations are in the given list, in the same order. Equivalent to applying `bitsToUInt` to every element of the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "bytes\\_to\\_uints"
    return:
      "list\\[uint\\[N\\] $S @D\\] $pre @public"
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
        "byt\\_width"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "byt\\_val"
      type:
        "uint $pre @public"
    constraints:
    description:
      "> Little-endian representation of the integer in the stage `$pre` given as the first argument on base given as the third argument, using the number of digits given as the second argument. If this number of digits is not enough, the digits of higher units are omitted."
    effect:
      ""
    modifier:
      ""
    name:
      "bytextract\\_pre"
    return:
      "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "byts"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "byt\\_val"
      type:
        "uint $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The integer whose little-endian representation on base given as the second argument is given as the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "byts\\_to\\_uint"
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
        "g"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "e"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "ebw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The integer given as the first argument raised to the power given as the second argument. A variant of the fast exponentiation algorithm is used for computation. The third argument is the public length of bits to fit the binary representation of the exponent."
    effect:
      ""
    modifier:
      ""
    name:
      "pow"
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
        "g"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "e"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "ebw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> The integer given as the first argument raised to the power whose little-endian binary representation is given as the second argument. The length of the significant initial part of the binary representation is given as the third argument."
    effect:
      ""
    modifier:
      ""
    name:
      "pow'"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
...
