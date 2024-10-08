---
api:
- module:
    "FastFixedPoint"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The sum of the given two fixed-point numbers. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers. Does not check that the sum fits to this number of bits. Use `check_fixed` to check it manually when necessary."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Check that a fixed-point number fits in its required number of bits. Can be used after an operation or a series of operations that do not do this check. Some operations (e.g. `add_fixed`, `sub_fixed`, `negate_fixed`) have left out this check for efficiency, so that several such operations can be done in row before calling `check_fixed`. This is safe if the intermediate results do not overflow the modulus (but they do not have to fit into `len` bits). For example, three fixed-point numbers can be added together by `{let w = add_fixed(x, add_fixed(y, z)); check_fixed(w); w}`, calling `check_fixed` only once rather than twice. This is safe if `3*(2^len - 1) < N`."
    effect:
      ""
    modifier:
      ""
    name:
      "check\\_fixed"
    return:
      "\\(\\) $pre @public"
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
    - modifier:
        ""
      name:
        "pplen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> A helper function used to implement division in both `FastFixedPoint` and `FastFixedPointVec` modules. Intended for standard library programmers only."
    effect:
      ""
    modifier:
      ""
    name:
      "coef\\_div\\_pre"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The ratio of the given two fixed-point numbers. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the ratio does not fit to this number of bits. Also fails if the second operand is zero."
    effect:
      ""
    modifier:
      ""
    name:
      "div\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the given two fixed-point numbers are equal. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "eq\\_fixed"
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
        "coef"
      type:
        "uint\\[N\\] $S @D"
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
    description:
      "> A new fixed-point number with the given parameters (the integral value that ignores binary point; the number of bits; the number of bits following the binary point). Fails if the integral value does not fit to the required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "x"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Oblivious choice according to the given boolean between the given two fixed-point numbers. Assumes that the numbers are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_cond"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "coef"
      type:
        "uint\\[N\\] $S @D"
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
    description:
      "> A new fixed-point number with the given parameters (the integral value that ignores binary point; the number of bits; the number of bits following the binary point). Fails if the new fixed-point number would be negative, or if the integral value does not fit to the required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_nonnegative"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given fixed-point number to the stage `$post`, putting it on a wire if it is in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_post"
    return:
      "Fixed\\[N, $post, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given fixed-point number to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_pre"
    return:
      "Fixed\\[N, $pre, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given fixed-point number to the domain `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_prover"
    return:
      "Fixed\\[N, $S, @prover\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Representing the given fixed-point number as a bit string (for testing purposes)."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_to\\_bitstring"
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
        "f"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Representing the given fixed-point number in decimal (for testing purposes)."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_to\\_string"
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
        "Fixed\\[N, $S, @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given fixed-point number from the domain `@public` to the domain `@verifier`."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_verifier"
    return:
      "Fixed\\[N, $S, @verifier\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is greater than or equal to the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_fixed"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is less than the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_fixed"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "new\\_len"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Increases the number of bits of a fixed-point number, without changing its value. Fails if the new `len` is less than the old `len`. Does not check that the new `len` fits in the modulus."
    effect:
      ""
    modifier:
      ""
    name:
      "increase\\_len\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is less than or equal to the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_fixed"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is less than the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_fixed"
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
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "bw"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Signed comparison of two integers in `uint[N]`, i.e. `x` and `y` are interpreted as bw-bit signed integers in the range `-2^(bw-1) .. 2^(bw-1)-1`. Tests if `x` is less than `y`."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_signed"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Find the maximum of two fixed-point numbers. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "max\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Find the minimum of two fixed-point numbers. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "min\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two fixed-point numbers. Assumes that they are correctly formed. The result is rounded to the same number of bits after the binary point as the arguments. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the product does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> An alternative implementation of `mult_fixed`, using `mult_fixed_exact`, followed by `round_down_fixed`. Should have same semantics and similar performance."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_fixed\\_alternative"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two fixed-point numbers. Does not round the result, instead the `len` and `pplen` of the result are the sum of the `len` and `pplen` of the arguments, respectively. This is much faster than `mult_fixed`. If the modulus is not large enough to fit numbers with new `len` bits then it fails. If the inputs are correctly formed (fit in the required number of bits) then the result is as well."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_fixed\\_exact"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Negation of the given fixed-point number. If the given number is the smallest one representable within the number of bits and the number of bits after the binary point, then overflow will occur which is not checked. Use `check_fixed` to check it manually when necessary."
    effect:
      ""
    modifier:
      ""
    name:
      "negate\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the given two fixed-point numbers are distinct. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "neq\\_fixed"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
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
    description:
      "> Reduces `pplen` by rounding towards minus infinity. The arguments specify both a new `len` and a new `pplen`. Fails if the new `pplen` is greater than the old one or if the rounded result does not fit in the new `len` bits or if adding the rounded-down bits back to the new `len` would overflow the modulus. The input fixed-point number does not have to fit in its `len` bits."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_down\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Rounds a fixed-point number down to the nearest integer less than or equal to it, i.e. it takes the floor of the fixed-point number. Fails if the input does not fit into its `len` bits."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_down\\_fixed\\_to\\_int"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Rounds a fixed-point number to the nearest integer, either up or down whichever is closer. `n + 0.5`, for an integer `n`, is rounded to `n + 1`, even for negative `n`. Fails if the output does not fit into its `len` bits, which can also occur for correctly formed inputs that are so close to the maximum allowed value that rounding up to an integer overflows the required number of bits. If the input is slightly below the minimum allowed value but after rounding up fits in the required number of bits then it does not fail."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_fixed\\_to\\_nearest\\_int"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Rounds a fixed-point number up to the nearest integer greater than or equal to it, i.e. it takes the ceiling of the fixed-point number. Fails if the output does not fit into its `len` bits, which can also occur for correctly formed inputs that are so close to the maximum allowed value that rounding up to an integer overflows the required number of bits. If the input is slightly below the minimum allowed value but after rounding up fits in the required number of bits then it does not fail."
    effect:
      ""
    modifier:
      ""
    name:
      "round\\_up\\_fixed\\_to\\_int"
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
    constraints:
    description:
      "> Convert a `uint[N]` integer in `$pre` into a `uint`, interpreting the `uint[N]` as a value in the range `-N/2 .. N-N/2-1` instead of `0 .. N-1`. E.g. `N-1` is converted to `-1`, etc."
    effect:
      ""
    modifier:
      ""
    name:
      "signed\\_uintN\\_to\\_uint"
    return:
      "uint $pre @D"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Square root of the given fixed-point number. Assumes that the number is correctly formed. Fails if the given fixed-point number is negative."
    effect:
      "[*,*,*] -> [*,*,*] ! <$S>"
    modifier:
      ""
    name:
      "sqrt\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
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
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Square root of the given fixed-point number in `$pre`. Assumes that the number is correctly formed. Fails if the given fixed-point number is negative."
    effect:
      ""
    modifier:
      ""
    name:
      "sqrt\\_fixed\\_pre"
    return:
      "Fixed\\[N, $pre, @D\\] $pre @public"
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
        "Fixed\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The difference of the given two fixed-point numbers. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers. Does not check that the sum fits to this number of bits. Use `check_fixed` to check it manually when necessary."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[N\\] $S @D"
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
    description:
      "> A new fixed-point number whose value is the integer given as the first argument, with the number of bits and the number of bits after the binary point given as the second and the third arguments. Fails if the integral value (along with zeros after the binary point) does not fit to the required number of bits but does not check that it fits into the modulus (if overflowing the modulus wraps it around to a value that fits in the number of bits then it is not detected)."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_to\\_fixed"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
