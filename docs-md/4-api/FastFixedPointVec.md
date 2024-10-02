---
api:
- module:
    "FastFixedPointVec"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Adding a scalar to all elements of a fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fixed\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Adding two fixed-point vectors elementwise, checked, very slow."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Adding two fixed-point vectors elementwise, increases the `len` by `1` to guarantee fitting, very fast."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fv\\_exact"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Adding two fixed-point vectors elementwise, unchecked, very fast."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $pre, @public\\] $pre @public"
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Adding a constant to all elements of a fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_prefixed\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Checking that each element of a fixed-point vector fits in `len` bits. The same as `checked_fv` but without returning the input vector."
    effect:
      ""
    modifier:
      ""
    name:
      "check\\_fv"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Returning the same fixed-point vector after checking that each element fits in `len` bits. Can be applied to the result of functions with the suffix `_unchecked` to make them safe. Sometimes it is possible to make several `_unchecked` operations in a row before calling the expensive `checked_fv`, as long as the intermediate results do not overflow the modulus (but they do not have to fit into `len` bits). For example, three fixed-point vectors can be added together by `checked_fv(add_fv_unchecked(xs, add_fv_unchecked(ys, zs)))`, calling `checked_fv` only once rather than twice. This is safe if `3*(2^len - 1) < N`."
    effect:
      ""
    modifier:
      ""
    name:
      "checked\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Decreasing the `len` of each element of a fixed-point vector without checking for fitting into the new `len` bits."
    effect:
      ""
    modifier:
      ""
    name:
      "decrease\\_len\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Dividing a scalar by each element of a fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "div\\_fixed\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Dividing two fixed-point vectors elementwise."
    effect:
      ""
    modifier:
      ""
    name:
      "div\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    constraints:
    - "Vectorization"
    description:
      "> An empty fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "empty\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "coefs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Creating a fixed-point vector, checking for fitting in `len` bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fv\\_checked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "coefs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Creating a fixed-point vector without checking for fitting in `len` bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Comparing each element of the input fixed-point vector `xv` with a scalar `y`. Returns a fixed-point vector with the same number of elements as `xv`, with the `i`th element being `1` if `xv[i] >= y` and `0` otherwise."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_fv\\_fixed"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Increasing `pplen` of each element of a fixed-point vector to a given value and increasing the `len` to keep `len - pplen` the same as before."
    effect:
      ""
    modifier:
      ""
    name:
      "increase\\_pplen\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Comparing each element of the input fixed-point vector `xv` with a scalar `y`. Returns a fixed-point vector with the same number of elements as `xv`, with the `i`th element being `1` if `xv[i] <= y` and `0` otherwise."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_fv\\_fixed"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    description:
      "> Removing values from the wire range corresponding to the fixed-point vector, to make circuit generation faster if the values are no longer needed in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "make\\_unknown\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> The *i*th element of the output is the maximum of the scalar and the *i*th element of the input fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "max\\_fixed\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Elementwise maximum of two fixed-point vectors."
    effect:
      ""
    modifier:
      ""
    name:
      "max\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> The *i*th element of the output is the minimum of the scalar and the *i*th element of the input fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "min\\_fixed\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Elementwise minimum of two fixed-point vectors."
    effect:
      ""
    modifier:
      ""
    name:
      "min\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Multiplying all elements of a fixed-point vector by a scalar, no rounding, fast, the `len` and `pplen` of the result are the sum of the `len` and `pplen` of the arguments, respectively."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_fixed\\_fv\\_exact"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "xs"
      type:
        "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Multiplying all elements of an integer vector by a fixed-point scalar, unchecked, fast."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_fixed\\_uv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Multiplying two fixed-point vectors elementwise, rounding, slow."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Multiplying two fixed-point vectors elementwise, no rounding, fast, the `len` and `pplen` of the result are the sum of the `len` and `pplen` of the arguments, respectively."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_fv\\_exact"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $pre, @public\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Multiplying all elements of a fixed-point vector by a constant, no rounding, fast, the `len` and `pplen` of the result are the sum of the `len` and `pplen` of the arguments, respectively."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_prefixed\\_fv\\_exact"
    return:
      "FixedVec\\[N\\] $pre @public"
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
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Multiplying all elements of a fixed-point vector by an integer scalar, unchecked, fast."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_uint\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
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
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Multiplying an integer vector and a fixed-point vector elementwise, unchecked, fast."
    effect:
      ""
    modifier:
      ""
    name:
      "mul\\_uv\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Negating (multiplying by `-1`) the elements of a fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "negate\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Decreasing the `pplen` of each element of a fixed-point vector by rounding down (towards minus infinity) some of the final bits."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_down\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Rounding down half of the bits after the point of each element of a fixed-point vector, can be used after `mul_fv_exact` to get back to the original `len` and `pplen`."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_down\\_fv\\_to\\_half"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Rounding each element of a fixed-point vector down to an integer (taking the floor of each element)."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_down\\_fv\\_to\\_int"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Unchecked version of round_down_fv, about twice as fast."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_down\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
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
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The scalar product (dot product) of an integer vector and a fixed-point vector, unchecked."
    effect:
      ""
    modifier:
      ""
    name:
      "scalar\\_prod\\_uv\\_fv\\_unchecked"
    return:
      "Fixed\\[N, $post, @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "i1"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        ""
      name:
        "i2"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> A slice of another fixed-point vector, including elements with indices from `i1` (inclusive) to `i2` (exclusive)."
    effect:
      ""
    modifier:
      ""
    name:
      "slice\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Taking a square root of all elements of a fixed-point vector."
    effect:
      ""
    modifier:
      ""
    name:
      "sqrt\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Subtracting two fixed-point vectors elementwise, checked, very slow."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_fv"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "yv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Subtracting two fixed-point vectors elementwise, unchecked, very fast."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The sum of the elements of a fixed-point vector, unchecked."
    effect:
      ""
    modifier:
      ""
    name:
      "sum\\_fv\\_unchecked"
    return:
      "Fixed\\[N, $post, @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xv"
      type:
        "FixedVec\\[N\\] $pre @public"
    constraints:
    description:
      "> Converting a fixed-point vector to a list of fixed-point scalars."
    effect:
      ""
    modifier:
      ""
    name:
      "thaw\\_fv"
    return:
      "list\\[Fixed\\[N, $post, @prover\\] $pre @public\\] $pre @public"
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
    - modifier:
        ""
      name:
        "pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Converting an integer vector into a fixed-point vector, unchecked."
    effect:
      ""
    modifier:
      ""
    name:
      "uv\\_to\\_fv\\_unchecked"
    return:
      "FixedVec\\[N\\] $pre @public"
    typeArgs:
    - "N : Nat"
...
