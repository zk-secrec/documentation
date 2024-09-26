---
api:
- module:
    "Ratio"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The sum of the given two rational numbers in `$pre`. Fails if the numerator and the denominator of the result do not fit to the limit of the first summand."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_ratio"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The sum of the given two rational numbers. Fails if the numerator and the denominator of the result do not fit to the limit of the first summand. The given SizeAsserter object is used for checking this."
    effect:
      ""
    modifier:
      ""
    name:
      "add\\_ratio3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the given two rational numbers have the same value."
    effect:
      ""
    modifier:
      ""
    name:
      "eq\\_ratio"
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
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
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
      "> The closest lower approximation of the given rational number in `$pre` in the form of a fixed-point number, provided that the number of bits and the number of bits after the binary point are given as the second and the third parameter. Fails if the integral value does not fit to the required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_from\\_ratio"
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
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
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
      "> The closest lower approximation of the given rational number in the form of a fixed-point number, provided that the number of bits and the number of bits after the binary point are given as the second and the third parameter. The fourth argument must be a list of SizeAsserter objects as produced by `Inequalities::sizeasserters_new`. Fails if the integral value does not fit to the required number of bits or the list of SizeAsserter objects is too short to contain one with required number of bits."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_from\\_ratio3"
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
        "lim"
      type:
        "uint\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given fixed-point number in `$pre` to a rational number. Fails if the integral value of the fixed-point number does not fit to the limit given as the second argument."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_to\\_ratio"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
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
        "lim"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given fixed-point number to a rational number. Fails if the integral value of the fixed-point number does not fit to the limit given as the second argument. The given SizeAsserter object is used for checking this condition."
    effect:
      ""
    modifier:
      ""
    name:
      "fixed\\_to\\_ratio3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number in `$pre` is greater than or equal to the second one. Fails if the limits of the given two numbers differ."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_ratio"
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
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number is greater than or equal to the second one. Fails if the limits of the given two numbers differ. The given SizeAsserter object is used for comparison."
    effect:
      ""
    modifier:
      ""
    name:
      "ge\\_ratio3"
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
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number in `$pre` is greater than the second one. Fails if the limits of the given two numbers differ."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_ratio"
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
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number is greater than the second one. Fails if the limits of the given two numbers differ. The given SizeAsserter object is used for comparison."
    effect:
      ""
    modifier:
      ""
    name:
      "gt\\_ratio3"
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
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number in `$pre` is less than or equal to the second one. Fails if the limits of the given two numbers differ."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_ratio"
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
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number is less than or equal to the second one. Fails if the limits of the given two numbers differ. The given SizeAsserter object is used for comparison."
    effect:
      ""
    modifier:
      ""
    name:
      "le\\_ratio3"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    constraints:
    - "Field\\[N\\]"
    description:
      "> A field element suitable for using as the value of `lim` in Ratio objects."
    effect:
      ""
    modifier:
      ""
    name:
      "limit"
    return:
      "uint\\[N\\] $S @public"
    typeArgs:
    - "N : Nat"
    - "$S"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number in `$pre` is less than the second one. Fails if the limits of the given two numbers differ."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_ratio"
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
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given rational number is less than the second one. Fails if the limits of the given two numbers differ. The given SizeAsserter object is used for comparison."
    effect:
      ""
    modifier:
      ""
    name:
      "lt\\_ratio3"
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
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two rational numbers in `$pre`. Fails if the numerator and the denominator of the result do not fit to the limit of the first factor."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_ratio"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The product of the given two rational numbers. Fails if the numerator and the denominator of the result do not fit to the limit of the first factor. The given SizeAsserter object is used for checking this."
    effect:
      ""
    modifier:
      ""
    name:
      "mult\\_ratio3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The additive inverse of the given rational number. Fails if the given rational number is the smallest one with its denominator fitting to the limit (then the additive inverse does not fit to the limit)."
    effect:
      ""
    modifier:
      ""
    name:
      "negate\\_ratio"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the given two rational numbers have distinct values."
    effect:
      ""
    modifier:
      ""
    name:
      "neq\\_ratio"
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
        "n"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "m"
      type:
        "uint\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "lim"
      type:
        "uint\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The rational number with the given numerator, denominator and limit in $pre. Fails if the numerator and denominator do not fit to the limit."
    effect:
      ""
    modifier:
      ""
    name:
      "ratio"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
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
        "m"
      type:
        "uint\\[N\\] $pre @public"
    - modifier:
        ""
      name:
        "lim"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The rational number with the given numerator, denominator and limit. Fails if the numerator and denominator do not fit to the limit. The given SizeAsserter object is used for checking this condition."
    effect:
      ""
    modifier:
      ""
    name:
      "ratio3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given rational number to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "ratio\\_to\\_pre"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    constraints:
    description:
      "> The string representation of the given rational number."
    effect:
      ""
    modifier:
      ""
    name:
      "ratio\\_to\\_string"
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
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The difference of the given two rational numbers in `$pre`. Fails if either the second addend is the smallest one with its denominator fitting to the limit or the numerator and the denominator of the result do not fit to the limit of the first summand."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_ratio"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "yr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The difference of the given two rational numbers. Fails if either the second addend is the smallest one with its denominator fitting to the limit or the numerator and the denominator of the result do not fit to the limit of the first summand. The given SizeAsserter object is used for checking the latter condition."
    effect:
      ""
    modifier:
      ""
    name:
      "sub\\_ratio3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
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
        "lim"
      type:
        "uint\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The rational number whose value equals the given integer in `$pre`, with the given limit in `$pre`. Fails if the value does not fit to the limit."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_to\\_ratio"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
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
        "lim"
      type:
        "uint\\[N\\] $S @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The rational number whose value equals the given integer, with the given limit. Fails if the value does not fit to the limit. The given SizeAsserter object is used for checking this."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_to\\_ratio3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $pre, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The closest lower approximation of the given rational number in `$pre` that has the given denominator. Fails if the numerator and the denominator of the result do not fit to the limit of the given rational number."
    effect:
      ""
    modifier:
      ""
    name:
      "with\\_denominator"
    return:
      "Ratio\\[N, $pre, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xr"
      type:
        "Ratio\\[N, $S, @D\\] $pre @public"
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The closest lower approximation of the given rational number that has the given denominator. Fails if the numerator and the denominator of the result do not fit to the limit of the given rational number. The given SizeAsserter object is used for checking this."
    effect:
      ""
    modifier:
      ""
    name:
      "with\\_denominator3"
    return:
      "Ratio\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
