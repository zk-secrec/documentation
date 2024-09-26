---
api:
- module:
    "Poseidon"
- function:
    args:
    - modifier:
        ""
      name:
        "data"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "t"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "r"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "o"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "alpha"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "R\\_F"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "R\\_P"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "round\\_constants"
      type:
        "list\\[uint\\[N\\] $S @public\\] $pre @public"
    - modifier:
        ""
      name:
        "mds\\_matrix"
      type:
        "list\\[list\\[uint\\[N\\] $S @public\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "rate\\_first"
      type:
        "bool $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Hashing the data given as the first argument with Poseidon instance with parameters given as the other arguments."
    effect:
      ""
    modifier:
      ""
    name:
      "poseidon"
    return:
      "list\\[uint\\[N\\] $S @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "poseidon\\_obj"
      type:
        "PoseidonInstance\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "data"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Absorbing new data given as the second argument into the PoseidonInstance object given as the first argument. Fails if the length of the data list is not a multiple of the parameter r of the PoseidonSpongeParams object (in the `sponge_params` field of the PoseidonInstance object)."
    effect:
      ""
    modifier:
      ""
    name:
      "poseidon\\_continue"
    return:
      "PoseidonInstance\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "poseidon\\_obj"
      type:
        "PoseidonInstance\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Final output of the given PoseidonInstance object, assuming that it has absorbed all necessary data."
    effect:
      ""
    modifier:
      ""
    name:
      "poseidon\\_finalize"
    return:
      "list\\[uint\\[N\\] $S @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "t"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "r"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "o"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "alpha"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "R\\_F"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "R\\_P"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        ""
      name:
        "round\\_constants"
      type:
        "list\\[uint\\[N\\] $S @public\\] $pre @public"
    - modifier:
        ""
      name:
        "mds\\_matrix"
      type:
        "list\\[list\\[uint\\[N\\] $S @public\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "rate\\_first"
      type:
        "bool $pre @public"
    constraints:
    description:
      "> A new PoseidonInstance object with the given parameters. Fails if the parameters do not satisfy two conditions assumed about Poseidon instances (`r` < `t`, `R_F` is even)."
    effect:
      ""
    modifier:
      ""
    name:
      "poseidon\\_initialize"
    return:
      "PoseidonInstance\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        "ref"
      name:
        "inner\\_state"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "perm\\_params"
      type:
        "PoseidonPermParams\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "partial\\_round\\_pow\\_i"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Applying the Poseidon permutation with parameters given as the second and third arguments to the state given as the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "poseidon\\_perm"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
