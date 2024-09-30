---
api:
- module:
    "IsFromFirst"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "list\\[uint\\[N\\] $post @verifier\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
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
    - "Challenge\\[N\\]"
    description:
      "> The concatenation of the given two lists, with all elements replaced with booleans indicating if the element occurs in the first given list. Fails if either argument list contains an element that is not representable using the number of bits specified in the given SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_from\\_first"
    return:
      "list\\[bool\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "lens"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "maxlen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The first argument list, each element having been replaced with a boolean indicating if the previous element is a prefix of this element, where the original elements are interpreted as strings that evaluate to them via the `String::eval_string` function. Assumes that the strings consist of 8-bit characters and their lengths are given in the second argument list. The third argument is assumed to be an upper bound of all the lengths."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_prefixed\\_by\\_last"
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
        "xs"
      type:
        "list\\[uint\\[N\\] $post @verifier\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "list\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "xlens"
      type:
        "list\\[uint\\[N\\] $post @verifier\\] $pre @public"
    - modifier:
        ""
      name:
        "ylens"
      type:
        "list\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "maxlen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> The concatenation of the first two argument lists, with all elements replaced with booleans indicating if the element has a prefix occurring in the first given list, where the original elements are interpreted as strings that evaluate to them via the `String::eval_string` function. Assumes that the strings consist of 8-bit characters and their lengths are given as the third and the fourth argument list. The fifth argument is assumed to be an upper bound of all the lengths. Fails if either of the first two lists contains an element that is not representable using the number of bits specified in the given SizeAsserter object."
    effect:
      "[*] -> [*] -> [*] -> [*] -> * -> [*,*,[*]] -> [*] ! <@public>"
    modifier:
      ""
    name:
      "is\\_prefixed\\_from\\_first"
    return:
      "list\\[bool\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "instances"
      type:
        "list\\[String\\[$post, @verifier, N\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "witnesses"
      type:
        "list\\[String\\[$post, @prover, N\\] $pre @public\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> The concatenation of the given two lists, with all elements replaced with booleans indicating if the element occurs in the first given list. Assumes that all String objects in the given lists consist of 8-bit characters and evaluate (via the `String::eval_string` function) to a number less than the modulus. Fails if either argument list contains a String object whose value is not representable using the number of bits specified in the given SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_is\\_from\\_first"
    return:
      "list\\[bool\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
...
