---
api:
- module:
    "ChrVec"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the argument list is a characteristic vector, i.e., contains exactly one true value. Assumes that the length of the list is less than the modulus."
    effect:
      ""
    modifier:
      ""
    name:
      "check\\_chrvec"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "ind"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The characteristic vector of the natural number given as the second argument, having length given as the first argument. If the second argument is not less than the first argument then the result consists of falses only."
    effect:
      ""
    modifier:
      ""
    name:
      "chrvec"
    return:
      "list\\[bool\\[N\\] $S @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[18446744073709551616\\] $pre @D"
    - modifier:
        ""
      name:
        "is"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @D"
    constraints:
    description:
      "> The characteristic vector of the given list of indices in `$pre`, having length given as the first argument. Fails if the given list contains any number not less than the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "chrvec\\_list\\_pre"
    return:
      "list\\[bool\\[N\\] $pre @D\\] $pre @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "ind"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The characteristic vector of being less than the natural number given as the second argument, having length given as the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "chrvec\\_lt"
    return:
      "list\\[bool\\[N\\] $S @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "text"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "ind"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The element of the list given as the first argument located at the position given as the second argument. Fails if the position is out of bounds of the list."
    effect:
      ""
    modifier:
      ""
    name:
      "element"
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
        "text"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "ind"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "m"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A segment of the list given as the first argument, starting from the index given as the second argument and having length given as the third argument. Fails if the segment would extend beyond the end of the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "segment"
    return:
      "list\\[uint\\[N\\] $S @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
