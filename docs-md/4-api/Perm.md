---
api:
- module:
    "Perm"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[list\\[uint\\[N\\] $S @D\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "perm"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> The list of permutation images of the lists in the given list of lists, when the permutation given as the second argument is applied."
    effect:
      ""
    modifier:
      ""
    name:
      "apply\\_perm"
    return:
      "list\\[list\\[uint\\[N\\] $S @D\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
