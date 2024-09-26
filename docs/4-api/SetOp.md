---
api:
- module:
    "SetOp"
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
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> Assertion that the two given lists have no common elements. Fails if either argument list contains an element that is not representable using the number of bits specified in the given SizeAsserter object."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_disjoint"
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
        ""
      name:
        "ys"
      type:
        "list\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> Assertion that all numbers occurring in the first list occur in the second list at least as many times."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_subset"
    return:
      "\\(\\) $pre @public"
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
        "list\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "list\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> Assertion that all numbers occurring in the first list occur in the second list at least once."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_subset\\_norep"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
...
