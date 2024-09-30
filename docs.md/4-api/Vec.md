---
api:
- module:
    "Vec"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> The absolute values of the elements in the given vector on wires, all values being considered as signed integers with the number of bits given as the second argument."
    effect:
      ""
    modifier:
      ""
    name:
      "abs\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Adding the constant in `$pre` to all elements of the vector on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_preuint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Adding the fixed value on wire to all elements of the vector on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_uint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise logical conjunction of given two vectors on wires, 1 meaning true and 0 meaning false."
    effect:
      ""
    modifier:
      ""
    name:
      "and\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Assertion of terms in each pair of corresponding elements of two given vectors on wires being equal."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_eq\\_uv"
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
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Assertion of every element in the first vector on wires being less than the corresponding element in the second vector on wire. All values are considered as unsigned integers with the number of bits given as the third argument."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_lt\\_uv"
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
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Assertion of all elements of given vector on wires being equal to one."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_one\\_uv"
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
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Assertion of all elements of given vector on wires being zeros."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_zero\\_uv"
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
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> The little endian binary representations of the integers in the given vector on wires. The second argument is the public length of the resulting list of vectors on wires. Every vector in the resulting list contains the corresponding bit in each representation. If any of the integers cannot be represented by the expected number of bits then a run time error occurs."
    effect:
      ""
    modifier:
      ""
    name:
      "bitextract\\_uv"
    return:
      "list\\[arr\\[uint\\[N\\] $post @prover\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Assertion that all elements of the given vector on wires are bits (either 0 or 1)."
    effect:
      ""
    modifier:
      ""
    name:
      "check\\_bit\\_uv"
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
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise greater-than-or-equal-to relation of two vectors on wires, all values being considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Greater-than-or-equal-to relation applied to each element of the given vector on wires and the fixed value on wire. All values are considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_uv\\_uint"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise greater-than relation of two vectors on wires, all values being considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Greater-than relation applied to each element of the given vector on wires and the fixed value on wire. All values are considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_uv\\_uint"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> The signs of the elements in the given vector on wires, all considered as signed integers with the number of bits given as the second argument. In the result, 1 means non-negative and 0 means negative."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_nonnegative\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise less-than-or-equal-to relation of two vectors on wires, all values being considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Less-than-or-equal-to relation applied to each element of the given vector on wires and the fixed value on wire. All values are considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_uv\\_uint"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise less-than relation of two vectors on wires, all values being considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Less-than relation applied to each element of the given vector on wires and the fixed value on wire. All values are considered as unsigned integers with the number of bits given as the third argument. In the result, 1 means true (in relation), 0 means false (not in relation)."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_uv\\_uint"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
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
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Maximum of each element of the given vector on wires with the fixed value on wire. All values are considered as unsigned integers with the number of bits given as the third argument."
    effect:
      ""
    modifier:
      ""
    name:
      "max\\_uint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise maximum of two vectors on wires, all values being considered as unsigned integers with the number of bits given as the third argument."
    effect:
      ""
    modifier:
      ""
    name:
      "max\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
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
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Minimum of each element of the given vector on wires with the fixed value on wire. All values are considered as unsigned integers with the number of bits given as the third argument."
    effect:
      ""
    modifier:
      ""
    name:
      "min\\_uint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise minimum of two vectors on wires, all values being considered as unsigned integers with the number of bits given as the third argument."
    effect:
      ""
    modifier:
      ""
    name:
      "min\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Multiplying all elements of the vector on wires with the constant in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_preuint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Multiplying all elements of the vector on wires with the fixed value on wire."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_uint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Negating all elements of the vector on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "negate\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise logical negation of given vector on wires, 1 meaning true and 0 meaning false."
    effect:
      ""
    modifier:
      ""
    name:
      "not\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise logical disjunction of given two vectors on wires, 1 meaning true and 0 meaning false."
    effect:
      ""
    modifier:
      ""
    name:
      "or\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The product of all elements of a vector on wires."
    effect:
      "[*] -> * ! <$post>"
    modifier:
      ""
    name:
      "prod\\_uv"
    return:
      "uint\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The scalar (dot) product of two vectors on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "scalar\\_prod\\_uv"
    return:
      "uint\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Subtracting all elements of a vector on wires from a constant in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_preuint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "uint\\[N\\] $post @prover"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Subtracting all elements of a vector on wires from a fixed value on wire."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_uint\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Subtracting the second vector on wires from the first one pointwise. More efficient than vectorized subtraction due to negation being done via multiplying by constant -1 in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The sum of all elements of a vector on wires."
    effect:
      "[*] -> * ! <$post>"
    modifier:
      ""
    name:
      "sum\\_uv"
    return:
      "uint\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> A synonym of `bitextract_uv`."
    effect:
      ""
    modifier:
      ""
    name:
      "vectorized\\_bitextracts"
    return:
      "list\\[arr\\[uint\\[N\\] $post @prover\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Pointwise xor of given two vectors on wires, 1 meaning true and 0 meaning false."
    effect:
      ""
    modifier:
      ""
    name:
      "xor\\_uv"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
...
