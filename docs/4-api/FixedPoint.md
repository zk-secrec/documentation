---
api:
- module:
    "FixedPoint"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The sum of the given two fixed-point numbers in `$pre`. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the sum does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fixed"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The sum of the given two fixed-point numbers. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the sum does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_fixed3"
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
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The ratio of the given two fixed-point numbers in `$pre`. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the ratio does not fit to this number of bits. Also fails if the second operand is zero."
    effect:
      ""
    modifier:
      ""
    name:
      "div\\_fixed"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The ratio of the given two fixed-point numbers. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the ratio does not fit to this number of bits. Also fails if the second operand is zero."
    effect:
      ""
    modifier:
      ""
    name:
      "div\\_fixed3"
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
        "uint\\[N\\] $pre @D"
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
      "> A new fixed-point number in `$pre` with given parameters (the integral value that ignores binary point; the number of bits; the number of bits following the binary point). Fails if the integral value does not fit to the required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new fixed-point number with given parameters (the integral value that ignores binary point; the number of bits; the number of bits following the binary point). The fourth argument must be a list of SizeAsserter objects as produced by `Inequalities::sizeasserters_new`. Fails if the integral value does not fit to the required number of bits or the list of SizeAsserter objects is too short to contain one with required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed3"
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
        "bool\\[M\\] $S @D"
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
    - "Convertible\\[M,N\\]"
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
    - "M : Nat"
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
      "> Conversion of the given fixed-point number in `$pre` to any stage."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_downcast"
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
        "uint\\[N\\] $pre @D"
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
      "> A new fixed-point number in `$pre` with given parameters (the integral value that ignores binary point; the number of bits; the number of bits following the binary point). Fails if the new fixed-point number would be negative, or if the integral value does not fit to the required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_nonnegative"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new fixed-point number with given parameters (the integral value that ignores binary point; the number of bits; the number of bits following the binary point). The fourth argument must be a list of SizeAsserter objects as produced by `Inequalities::sizeasserters_new`. Fails if the new fixed-point number would be negative, or if the integral value does not fit to the required number of bits or the list of SizeAsserter objects is too short to contain one with required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_nonnegative3"
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
        "x"
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
        "Fixed\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number in `$pre` is greater than or equal to the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_fixed"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is greater than or equal to the second one. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_fixed3"
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
        "Fixed\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number in `$pre` is greater than the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_fixed"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is greater than the second one. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_fixed3"
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
        "Fixed\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number in `$pre` is less than or equal to the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_fixed"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is less than or equal to the second one. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_fixed3"
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
        "Fixed\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number in `$pre` is less than the second one. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_fixed"
    return:
      "bool\\[N\\] $pre @D"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given fixed-point number is less than the second one. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_fixed3"
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
        "Fixed\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two fixed-point numbers in `$pre`. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the product does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_fixed"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two fixed-point numbers. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the product does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_fixed3"
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
      "> Negation of the given fixed-point number. Fails if the given number is the smallest one representable within the number of bits and the number of bits after the binary point (the negation of this number would overflow these parameters)."
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
      "sqrt\\_fixed"
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
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Square root of the given fixed-point number. Assumes that the number is correctly formed. Fails if the given fixed-point number is negative."
    effect:
      ""
    modifier:
      ""
    name:
      "sqrt\\_fixed3"
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
    - modifier:
        ""
      name:
        "y"
      type:
        "Fixed\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The difference of the given two fixed-point numbers in `$pre`. Assumes that they are correctly formed. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the difference does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_fixed"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The difference of the given two fixed-point numbers. Assumes that they are correctly formed and the given list contains a SizeAsserter object for their number of bits. Fails if the numbers of bits or the numbers of bits after the binary point differ in the given fixed-point numbers or the difference does not fit to this number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_fixed3"
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
        "uint\\[N\\] $pre @D"
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
      "> A new fixed-point number whose value is the integer given as the first argument, with the number of bits and the number of bits after the binary point given as the second and the third arguments. Fails if the integral value (along with zeros after the binary point) does not fit to the required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_to\\_fixed"
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
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $S, @D\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new fixed-point number whose value is the integer given as the first argument, with the number of bits and the number of bits after the binary point given as the second and the third arguments. The fourth argument must be a list of SizeAsserter objects as produced by `Inequalities::sizeasserters_new`. Fails if the integral value (along with zeros after the binary point) does not fit to the required number of bits or the list of SizeAsserter objects is too short to contain one with required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_to\\_fixed3"
    return:
      "Fixed\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
