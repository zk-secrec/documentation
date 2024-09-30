---
api:
- module:
    "Inequalities"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two Prover's values on wires is greater than or equal to the second one. Fails also if the numbers do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_ge"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two checked Prover's values on wires is greater than or equal to the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_ge'"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two Prover's values on wires is greater than the second one. Fails also if the numbers do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_gt"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two checked Prover's values on wires is greater than the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_gt'"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two Prover's values on wires is less than or equal to the second one. Fails also if the numbers do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_le"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two checked Prover's values on wires is less than or equal to the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_le'"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two Prover's values on wires is less than the second one. Fails also if the numbers do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_lt"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first of the given two checked Prover's values on wires is less than the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_lt'"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the list of Prover's values on wires is non-decreasing. Fails also if not all the values fit into the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_sorted"
    return:
      "\\(\\) $pre @public"
    typeArgs:
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
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the given integer fits into the number of bits given by the SizeAsserter object. Returns a Checked object for the given integer."
    effect:
      ""
    modifier:
      ""
    name:
      "check\\_size"
    return:
      "Checked\\[N, $S, @D\\] $pre @public"
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
        "Checked\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given Checked object to the Prover's domain."
    effect:
      ""
    modifier:
      ""
    name:
      "checked\\_prover"
    return:
      "Checked\\[N, $S, @prover\\] $pre @public"
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
      "> Test if the first of the given two values in `$pre` is greater than or equal to the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "ge"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two values is greater than or equal to the second one. Triggers assertion failure if the numbers are in `$post` `@prover` and do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "ge3"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two checked Prover's values on wires is greater than or equal to the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "ge3'"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
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
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two values in `$pre` is greater than the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "gt"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two values is greater than the second one. Triggers assertion failure if the numbers are in `$post` `@prover` and do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "gt3"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two checked Prover's values on wires is greater than the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "gt3'"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the list of values in `$pre` is non-decreasing."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_sorted"
    return:
      "bool\\[N\\] $pre @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the list of values is non-decreasing. Triggers assertion failure if the numbers are in `$post` `@prover` and not all of them fit into the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_sorted3"
    return:
      "bool\\[N\\] $S @D"
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
      "> Test if the first of the given two values in `$pre` is less than or equal to the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "le"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two values is less than or equal to the second one. Triggers assertion failure if the numbers are in `$post` `@prover` and do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "le3"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two checked Prover's values on wires is less than or equal to the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "le3'"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
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
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two values in `$pre` is less than the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "lt"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two values is less than the second one. Triggers assertion failure if the numbers are in `$post` `@prover` and do not fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "lt3"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yc"
      type:
        "Checked\\[N, $post, @prover\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first of the given two checked Prover's values on wires is less than the second one. Assumes that the numbers have been checked to fit the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "lt3'"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
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
    - "Field\\[N\\]"
    description:
      "> Maximum of the given two values in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "max"
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
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Maximum of the given two values. Triggers an assertion failure if the numbers are in `$post` `@prover` and not both of them fit into the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "max3"
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
      "> Minimum of the given two values in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "min"
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
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Minimum of the given two values. Triggers an assertion failure if the numbers are in `$post` `@prover` and not both of them fit into the number of bits given by the SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "min3"
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
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> A new SizeAsserter object for the given number of bits. The number of bits must be less than binary logarithm of half of the modulus."
    effect:
      ""
    modifier:
      ""
    name:
      "sizeasserter\\_new"
    return:
      "SizeAsserter\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "bwlim"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> A list of new SizeAsserter objects, one for every number of bits less than the given limit. The limit must be less than binary logarithm of the modulus."
    effect:
      ""
    modifier:
      ""
    name:
      "sizeasserters\\_new"
    return:
      "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
