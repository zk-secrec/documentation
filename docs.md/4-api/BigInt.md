---
api:
- module:
    "BigInt"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "BigIntBlock\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of a block of a BigInt object in the stage `$pre` to the stage `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "BigIntBlock\\_to\\_post"
    return:
      "BigIntBlock\\[N, $post, @D\\] $pre @public"
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
        "BigIntBlock\\[N, $post, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of a block of a BigInt object in the stage `$post` to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "BigIntBlock\\_to\\_pre"
    return:
      "BigIntBlock\\[N, $pre, @D\\] $pre @public"
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
        "BigInt\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> The sum of the given two BigInt objects. The result is not normalized. Fails if the numbers of bits per block differ in the given BigInt objects or the public bound of some block exceeds half of the modulus."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_add"
    return:
      "BigInt\\[N, $S, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the given two BigInt objects have equal values. Fails if the given list does not contain a SizeAsserter object for the used number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_assert\\_eq"
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
        "x"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the value of the first given BigInt object is less than or equal to that of the second one. Fails if the given list does not contain a SizeAsserter object for the used number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_assert\\_le"
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
        "x"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the value of the first given BigInt object is less than that of the second one. Fails if the given list does not contain a SizeAsserter object for the used number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_assert\\_lt"
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
        "xn"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the value of the given BigInt object is non-negative. Assumes that the given BigInt object is normalized. Fails if the given list does not contain a SizeAsserter object for the used number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_assert\\_nonneg"
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
        "x"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the given BigInt object in `$post` is normalized, i.e., the number in each block or its absolute value fits to the required number of bits. Fails if the given list does not contain a SizeAsserter object for that number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_assert\\_normalization"
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
        "xn"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the value of the given BigInt object is zero. Assumes that the given BigInt object is normalized."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_assert\\_zero"
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
        "x"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    description:
      "> The total number of bits in the given BigInt object."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_bit\\_width"
    return:
      "uint\\[18446744073709551616\\] $pre @public"
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
        "BigInt\\[N, $S, @D1\\] $pre @public"
    constraints:
    - "@D1 \\<= @D2"
    description:
      "> Conversion of a BigInt object to a higher domain."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_cast"
    return:
      "BigInt\\[N, $S, @D2\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D1"
    - "@D2"
- function:
    args:
    - modifier:
        ""
      name:
        "b"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "t"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "f"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Oblivious choice according to the given boolean between the given two BigInt objects. The result is normalized, provided that the givens are normalized. Fails if the numbers of bits per block differ in the given BigInt objects."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_choose"
    return:
      "BigInt\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "b"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "t"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "f"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Oblivious choice according to the given boolean between the pair of the given two BigInt objects and the pair with components swapped. The result is normalized, provided that the givens are normalized. The function can be used in the field `cond_swap` of the struct `Waksman::ApplySwitchingNetworkInterface`. Fails if the numbers of bits per block differ in the given BigInt objects."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_conditional\\_swap"
    return:
      "tuple\\[BigInt\\[N, $S, @D\\] $pre @public, BigInt\\[N, $S, @D\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint $pre @public"
    - modifier:
        ""
      name:
        "x"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given constant in `$pre` and the given BigInt object in `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_constmul"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the given two BigInt objects have equal values. Fails if the given list does not contain a SizeAsserter object for the used number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_eq"
    return:
      "bool\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "bs"
      type:
        "list\\[bool\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bpb"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new BigInt object whose value is represented by the given list of booleans (assuming little-endian representation), using the given number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_from\\_bitarray"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "bs"
      type:
        "list\\[bool\\[2\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "bpb"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Convertible\\[2,N\\]"
    description:
      "> A new BigInt object whose value is represented by the given list of booleans (assuming little-endian representation), using the given number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_from\\_bool2\\_array"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "uint $pre @D"
    - modifier:
        ""
      name:
        "nblocks"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "bpb"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> A new BigInt object with the given value and parameters (the number of blocks; the number of bits per block). If the allowed number of blocks is not enough to fit the number, the higher blocks are omitted."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_from\\_uint"
    return:
      "BigInt\\[N, $pre, @D\\] $pre @public"
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
        "uint $pre @public"
    - modifier:
        ""
      name:
        "nblocks"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "bpb"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "sel"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new BigInt object with the given value or zero value (depending on the fourth argument) and the given parameters (the number of blocks; the number of bits per block). Assumes that the fourth argument is either 0 or 1 (the first option forcing the result to be zero). If the allowed number of blocks is not enough to fit the number, the higher blocks are omitted."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_from\\_uint\\_select"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xn"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the value of the given BigInt object is zero. Assumes that the given BigInt object is normalized."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_is\\_zero"
    return:
      "bool\\[N\\] $post @D"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The remainder of the first given BigInt object upon division by the second one. Fails if the numbers of bits per block differ in the given BigInt objects or the given list does not contain a SizeAsserter object for the number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_mod"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "p"
      type:
        "uint $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Division of the first given BigInt object by the second given BigInt object in the residue class ring modulo the integer given as the third argument. The result is normalized but the integrity of normalization is not checked. Fails if the numbers of bits per block differ in the given BigInt objects."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_mod\\_div"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The remainder of the value of the given BigInt object upon division by the given integer. The result is a normalized BigInt object. Fails if the given list does not contain a SizeAsserter object for the number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_modconst"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "BigInt\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> The product of the given two BigInt objects. The result is not normalized. Fails if the numbers of bits per block differ in the given BigInt objects."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_mul"
    return:
      "BigInt\\[N, $S, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two BigInt objects in `$post`. The result is not normalized. This computation is more efficient than that of `BigInt_mul` in `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_mul\\_post"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Negation of the given BigInt object."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_neg"
    return:
      "BigInt\\[N, $S, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The normal form of the given BigInt object in `$post`. Fails if the given list does not contain a SizeAsserter object for the used number of bits per block."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_normalize\\_post"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "BigInt\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> The difference of the given two BigInt objects. The result is not normalized. Fails if the numbers of bits per block differ in the given BigInt objects or the public bound of some block exceeds half of the modulus."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_sub"
    return:
      "BigInt\\[N, $S, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A little-endian representation of the value of the given BigInt object. Fails if the given BigInt object is not normalized or its value is negative."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_to\\_bitarray"
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
        "BigInt\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of a BigInt object in the stage `$pre` to the stage `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_to\\_post"
    return:
      "BigInt\\[N, $post, @D\\] $pre @public"
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
        "BigInt\\[N, $post, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of a BigInt object in the stage `$post` to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_to\\_pre"
    return:
      "BigInt\\[N, $pre, @D\\] $pre @public"
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
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> A string representation of the given BigInt object (for debugging)."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_to\\_string"
    return:
      "string $pre @D"
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
        "BigInt\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given BigInt object to an unsigned integer."
    effect:
      ""
    modifier:
      ""
    name:
      "BigInt\\_to\\_uint"
    return:
      "uint $pre @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
