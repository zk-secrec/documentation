---
api:
- module:
    "Waksman"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "list\\[bool\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "netDesc"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "switches"
      type:
        "list\\[bool\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The result of the permutation obtained by giving the switches in the third argument (in the format produced by `switches_of_perm`) as input to the network in the second argument (in the format produced by `make_waksman_network`) when applied to the list of booleans in the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "apply\\_switching\\_network\\_bool"
    return:
      "list\\[bool\\[N\\] $post @D\\] $pre @public"
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
        "list\\[T\\] $pre @public"
    - modifier:
        ""
      name:
        "netDesc"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "switches"
      type:
        "list\\[bool\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "interface"
      type:
        "ApplySwitchingNetworkInterface\\[T, N, @D\\] $pre @public"
    constraints:
    description:
      "> The generic result of the permutation obtained by giving the switches in the third argument (in the format produced by `switches_of_perm`) as input to the network in the second argument (in the format produced by `make_waksman_network`) when applied to the list in the first argument. Generic context is provided by the ApplySwitchingNetworkInterface object in the fourth argument."
    effect:
      ""
    modifier:
      ""
    name:
      "apply\\_switching\\_network\\_generic"
    return:
      "list\\[T\\] $pre @public"
    typeArgs:
    - "T : Qualified"
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "list\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "netDesc"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "switches"
      type:
        "list\\[bool\\[N\\] $post @D\\] $pre @public"
    constraints:
    description:
      "> The result of the permutation obtained by giving the switches in the third argument (in the format produced by `switches_of_perm`) as input to the network in the second argument (in the format produced by `make_waksman_network`) when applied to the list of integers in the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "apply\\_switching\\_network\\_uint"
    return:
      "list\\[uint\\[N\\] $post @D\\] $pre @public"
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
        "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> The list of switches on wires that, if given as input to the Waksman network of appropriate order, produces a permutation that sorts the given input list. Integrity is not checked."
    effect:
      ""
    modifier:
      ""
    name:
      "get\\_switches\\_for\\_sorting"
    return:
      "list\\[bool\\[N\\] $post @D\\] $pre @public"
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
    constraints:
    description:
      "> Constructing a Waksman permutation network of the given order. A synonym of the builtin function `__make_waksman_network`."
    effect:
      ""
    modifier:
      ""
    name:
      "make\\_waksman\\_network"
    return:
      "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    typeArgs:
- function:
    args:
    - modifier:
        ""
      name:
        "template"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @D\\] $pre @public"
    constraints:
    description:
      "> The list of switches which, if given as input to the Waksman network of the order of the length of the given permutation, leads to the given permutation. Unlike in the case of the builtin function `__permutation_switches`, the switches are returned as booleans."
    effect:
      ""
    modifier:
      ""
    name:
      "switches\\_of\\_perm"
    return:
      "list\\[bool\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
...
