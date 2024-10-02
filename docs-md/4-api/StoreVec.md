---
api:
- module:
    "StoreVec"
- function:
    args:
    - modifier:
        "ref"
      name:
        "st"
      type:
        "store\\[uint\\[N\\], uint\\[N\\]\\] $pre @D"
    - modifier:
        ""
      name:
        "def"
      type:
        "bool $pre @D"
    constraints:
    description:
      "> Setting if the given `$pre` store uses a default value when looking up a missing key or not (if set to false, a failure occurs in such case)."
    effect:
      "* -> * -> * ! <@public>"
    modifier:
      "extern"
    name:
      "set\\_store\\_default"
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
        "writeOnce"
      type:
        "bool $pre @public"
    - modifier:
        ""
      name:
        "contiguous"
      type:
        "bool $pre @public"
    - modifier:
        ""
      name:
        "def"
      type:
        "bool $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new empty store with given parameters: `writeOnce` being true means that the value for every key is set at most once; `contiguous` being true means that the used keys are consecutive; `def` being true means that a default value is returned if a missing key is looked up. It is up to the programmer that the conditions assumed by `writeOnce` and `contiguous` be valid."
    effect:
      ""
    modifier:
      ""
    name:
      "store\\_new"
    return:
      "Store\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new empty store with no writing once or contiguity assumptions and using a default value."
    effect:
      ""
    modifier:
      ""
    name:
      "store\\_new\\_def"
    return:
      "Store\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new empty store with no writing once or contiguity assumptions and not using a default value."
    effect:
      ""
    modifier:
      ""
    name:
      "store\\_new\\_nodef"
    return:
      "Store\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        "ref"
      name:
        "st"
      type:
        "Store\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "key"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Getting the value that corresponds to the key given as the second argument in the store given as the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "store\\_read"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        "ref"
      name:
        "st"
      type:
        "Store\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "keys"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The array of values that correspond to the keys in the array given as the second argument in the `$post` store given as the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "store\\_read\\_vec"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        "ref"
      name:
        "st"
      type:
        "Store\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "key"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "val"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    description:
      "> Setting the value given as the third argument to correspond to the key given as the second argument in the store given as the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "store\\_write"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
