---
api:
- module:
    "Builtin"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> The logical negation of the given boolean."
    effect:
      ""
    modifier:
      ""
    name:
      "\\!"
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The boolean indicating if the given two integers are distinct."
    effect:
      ""
    modifier:
      ""
    name:
      "\\!="
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The remainder upon division of the first given integer by the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "%"
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
        "x1"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> The logical and of the given two booleans."
    effect:
      ""
    modifier:
      ""
    name:
      "&"
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
        "x1"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    description:
      "> Modular multiplication of the given two integers."
    effect:
      ""
    modifier:
      ""
    name:
      "\\*"
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
        "x1"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    description:
      "> Modular addition of the given two integers."
    effect:
      ""
    modifier:
      ""
    name:
      "\\+"
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
        "x1"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    description:
      "> Modular subtraction of the second given integer from the first one."
    effect:
      ""
    modifier:
      ""
    name:
      "\\-"
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> Integral division of the first given integer by the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "/"
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The boolean indicating if the first of the given two integers is less than the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "\\<"
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The boolean indicating if the first of the given two integers is less than or equal to the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "\\<="
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The equality of the given two integers as a boolean."
    effect:
      ""
    modifier:
      ""
    name:
      "=="
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The boolean indicating if the first of the given two integers is greater than the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "\\>"
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
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> The boolean indicating if the first of the given two integers is greater than or equal to the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "\\>="
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
        "x1"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> The logical xor of the given two booleans. Synonym of `xor`."
    effect:
      ""
    modifier:
      ""
    name:
      "^"
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
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> Pointwise modular addition of the given two vectors. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_add"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> Modular addition of the value `x2` to every element of the vector `x1`. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_add\\_scalar"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> Modular addition of the constant `x2` to every element of the vector `x1`. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_addc"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "PermutationCheck"
    description:
      "> Checking if the given two vectors are permutations of each other. If the check fails then the whole proof fails. Makes use of the `permutation_check` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_assert\\_perm"
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
        "x1"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "ExtendedArithmetic"
    description:
      "> The big endian binary representation of the given integer, with the minimal length that can accommodate all elements of the field. Makes use of the `extended_arithmetic` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_bitextract"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "\\(\\) $pre @public"
    constraints:
    - "has\\-default\\-value\\[T $S @D\\]"
    description:
      "> The default value of given type. For integers the value is 0, for booleans the value is false, default containers are empty, and structured types are filled recursively with default values."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_default\\_value"
    return:
      "T $S @D"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "ExtendedArithmetic"
    description:
      "> Integral division of the first given integer by the second one. Makes use of the `extended_arithmetic` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_div"
    return:
      "uint\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "ExtendedArithmetic"
    description:
      "> Integral division of the first given integer by the second one, producing the quotient and the remainder together in a pair. Makes use of the `extended_arithmetic` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_divmod"
    return:
      "tuple\\[uint\\[N\\] $post @D, uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> The scalar product of the given two vectors. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_dotprod"
    return:
      "uint\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "list\\[uint $pre @D\\] $pre @public"
    constraints:
    description:
      "> The permutation that sorts the input."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_get\\_sorting\\_permutation"
    return:
      "list\\[uint\\[18446744073709551616\\] $pre @D\\] $pre @public"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "ExtendedArithmetic"
    description:
      "> The boolean indicating if the first of the given two integers is less than or equal to the second one. Makes use of the `extended_arithmetic` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_le"
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
        "x1"
      type:
        "uint\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "ExtendedArithmetic"
    description:
      "> The boolean indicating if the first of the given two integers is less than the second one. Makes use of the `extended_arithmetic` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_lt"
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
        "x1"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Constructing a Waksman permutation network of the given order."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_make\\_waksman\\_network"
    return:
      "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    typeArgs:
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint $pre @D"
    constraints:
    description:
      "> The inverse of `x1` modulo `x2`."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_mod\\_invert"
    return:
      "uint $pre @D"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> Pointwise modular multiplication of the given two vectors. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_mul"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> Modular multiplication of every element of the vector `x1` with the value `x2`. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_mul\\_scalar"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> Modular multiplication of every element of the vector `x1` with the constant `x2`. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_mulc"
    return:
      "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @D\\] $pre @public"
    constraints:
    description:
      "> Producing switches which, when input to the Waksman network of the order of the length of the given permutation, lead to the given permutation."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_permutation\\_switches"
    return:
      "list\\[bool $pre @D\\] $pre @public"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> The product of all elements of the given vector. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_prod"
    return:
      "uint\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectors"
    description:
      "> The sum of all elements of the given vector. Makes use of the `vectors` plugin."
    effect:
      ""
    modifier:
      ""
    name:
      "\\_\\_sum"
    return:
      "uint\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[T $pre @D\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> Putting all elements of the given vector onto wires in a consecutive range."
    effect:
      ""
    modifier:
      ""
    name:
      "array\\_to\\_post"
    return:
      "arr\\[T $post @D\\] $pre @public"
    typeArgs:
    - "T : Unqualified"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[uint\\[N\\] $post @verifier\\] $pre @public"
    constraints:
    description:
      "> Lifting all elements of the given vector to the prover's domain."
    effect:
      ""
    modifier:
      ""
    name:
      "array\\_to\\_prover"
    return:
      "arr\\[uint\\[N\\] $post @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "bool\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Checking if the given boolean is true. If this check fails then the whole proof fails."
    effect:
      ""
    modifier:
      ""
    name:
      "assert"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "T1 $post @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "T2 $post @D"
    constraints:
    - "assert\\-eq\\[T1,T2\\]"
    description:
      "> Checking if the given two field elements are equal as integers. If this check fails then the whole proof fails."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_eq"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
    - "T1 : Unqualified"
    - "T2 : Unqualified"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "list\\[uint\\[N1\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "list\\[bool\\[2\\] $post @D\\] $pre @public"
    constraints:
    - "Field\\[N1\\]"
    - "Field\\[2\\]"
    description:
      "> Checking if the given field element, represented as the singleton element of the given list of integers, equals the number represented by the given list of booleans. The latter binary representation is little-endian."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_eq\\_uints\\_bools"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N1 : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Checking if the given field element equals zero. If this check fails then the whole proof fails."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_zero"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint $pre @public"
    constraints:
    description:
      "> The little endian binary representation of the integer `x1`. The result list contains `x2` elements. If this number of bits is not enough to represent `x1` then a run time error occurs."
    effect:
      ""
    modifier:
      ""
    name:
      "bitextract\\_pre\\_uint"
    return:
      "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "list\\[uint\\[N\\] $post @D\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Vectorization"
    description:
      "> The little endian binary representations of the integers in `$pre` in the list `x1`. The result list contains `x2` elements. Every element in the resulting list is a vector that contains the corresponding bit in each representation. If any of the integers cannot be represented by the expected number of bits then a run time error occurs."
    effect:
      ""
    modifier:
      ""
    name:
      "bitextract\\_vec\\_helper"
    return:
      "list\\[arr\\[uint\\[N\\] $post @D\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "list\\[list\\[bool\\[N\\] $S @D\\] $pre @public\\] $pre @public"
    constraints:
    description:
      "> Calling a circuit `x1` with `x2` as input. The circuit search path can be specified via the `--circuits` argument when compiling the program. Each element in the outer list of `x2` corresponds to one input in the circuit and the inner list corresponds to the bits of that input. The return value is a list of bit arrays corresponding to the outputs of the circuit."
    effect:
      ""
    modifier:
      ""
    name:
      "call"
    return:
      "list\\[list\\[bool\\[N\\] $S @D\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "list\\[uint\\[18446744073709551616\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Calling a circuit `x1` with `x2` as input. The circuit search path can be specified via the `--circuits` argument when compiling the program. This variant of the `call` function assumes the inputs as 64-bit integers and produces outputs in the same form."
    effect:
      ""
    modifier:
      ""
    name:
      "callu"
    return:
      "list\\[uint\\[18446744073709551616\\] $S @D\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Challenge\\[N\\]"
    description:
      "> Producing a list of random field elements."
    effect:
      ""
    modifier:
      ""
    name:
      "challenge"
    return:
      "list\\[uint\\[N\\] $pre @verifier\\] $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @D"
    constraints:
    description:
      "> Printing the given string to standard output."
    effect:
      ""
    modifier:
      ""
    name:
      "dbg\\_print"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint $pre @public"
    constraints:
    description:
      "> The number of bits required to represent the given integer."
    effect:
      ""
    modifier:
      ""
    name:
      "field\\_bit\\_width"
    return:
      "uint\\[18446744073709551616\\] $pre @public"
    typeArgs:
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[T $S @D\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    description:
      "> Converting a tensor to a one-dimensional vector."
    effect:
      ""
    modifier:
      ""
    name:
      "flatten"
    return:
      "arr\\[T $S @D\\] $pre @DL"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "list\\[T $S @D\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    - "Vectorization"
    description:
      "> Converting a list to a vector of the same values in the same order."
    effect:
      ""
    modifier:
      ""
    name:
      "freeze"
    return:
      "arr\\[T $S @D\\] $pre @DL"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @public"
    constraints:
    - "instance\\-input\\[T,$S,@D\\]"
    description:
      "> Loading a value from the instance json file. The instance file can be passed to the compiler via the `--instance` argument."
    effect:
      ""
    modifier:
      ""
    name:
      "get\\_instance"
    return:
      "T $S @D"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @public"
    constraints:
    - "public\\-input\\[T,$S,@D\\]"
    description:
      "> Loading a value from the public json file. The public file can be passed to the compiler via the `--public` argument."
    effect:
      ""
    modifier:
      ""
    name:
      "get\\_public"
    return:
      "T $S @D"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @public"
    constraints:
    - "witness\\-input\\[T,$S,@D\\]"
    description:
      "> Loading a value from the witness json file. The witness file can be passed to the compiler via the `--witness` argument."
    effect:
      ""
    modifier:
      ""
    name:
      "get\\_witness"
    return:
      "T $S @D"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[T $S @D\\] $pre @DL"
    - modifier:
        ""
      name:
        "x2"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @DL\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    description:
      "> Lookup of an element at position `x2` in the tensor `x1`."
    effect:
      ""
    modifier:
      ""
    name:
      "index\\_tensor"
    return:
      "T $S @D"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[T $S @D\\] $pre @DL"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[18446744073709551616\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    description:
      "> Subtensor of the tensor `x1` corresponding to the index value `x2` of its first dimension."
    effect:
      ""
    modifier:
      ""
    name:
      "index\\_tensor\\_1"
    return:
      "arr\\[T $S @D\\] $pre @DL"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "TC\\[T $S @D\\] $pre @DL"
    constraints:
    - "Array\\[TC\\]"
    description:
      "> The length of the list or vector."
    effect:
      ""
    modifier:
      ""
    name:
      "length"
    return:
      "uint\\[18446744073709551616\\] $pre @DL"
    typeArgs:
    - "TC : Qualified \\-\\> Unqualified"
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    description:
      "> Associating a new $pre value, given in the second argument, to an unknown value given in the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "make\\_not\\_unknown"
    return:
      "uint\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "T $S @D"
    constraints:
    description:
      "> Forgetting the $pre copy of the value in order to save memory and time."
    effect:
      ""
    modifier:
      ""
    name:
      "make\\_unknown"
    return:
      "T $S @D"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Modular division of the first given integer by the second one."
    effect:
      ""
    modifier:
      ""
    name:
      "mod\\_div"
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
        "x1"
      type:
        "arr\\[T $S @D\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    description:
      "> The list of dimensions of the given tensor."
    effect:
      ""
    modifier:
      ""
    name:
      "size"
    return:
      "list\\[uint\\[18446744073709551616\\] $pre @DL\\] $pre @DL"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "string $pre @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "string $pre @D"
    constraints:
    description:
      "> Concatenating the given two strings."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_append"
    return:
      "string $pre @D"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[T $S @D\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    - "Vectorization"
    description:
      "> Converting a vector to a list of the same values in the same order."
    effect:
      ""
    modifier:
      ""
    name:
      "thaw"
    return:
      "list\\[T $S @D\\] $pre @DL"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "T $pre @D"
    constraints:
    - "ToString\\[T\\]"
    description:
      "> A string representation of the value."
    effect:
      ""
    modifier:
      ""
    name:
      "to\\_string"
    return:
      "string $pre @D"
    typeArgs:
    - "T : Unqualified"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "list\\[list\\[uint\\[N\\] $pre @D\\] $pre @public\\] $pre @public"
    - modifier:
        ""
      name:
        "x2"
      type:
        "list\\[list\\[uint\\[N\\] $pre @D\\] $pre @public\\] $pre @public"
    constraints:
    description:
      "> Multiplying the matrix `x1` with the transposed matrix `x2`."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_n\\_pre\\_matrix\\_prod"
    return:
      "list\\[list\\[uint\\[N\\] $pre @D\\] $pre @public\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "arr\\[T $S @D\\] $pre @DL"
    - modifier:
        ""
      name:
        "x2"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @DL\\] $pre @DL"
    constraints:
    - "Sized\\[T\\]"
    description:
      "> Converting a given vector `x1` to a tensor of dimensions given by the list `x2`."
    effect:
      ""
    modifier:
      ""
    name:
      "unflatten"
    return:
      "arr\\[T $S @D\\] $pre @DL"
    typeArgs:
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "TC\\[T $S @D\\] $pre @DL"
    constraints:
    - "Array\\[TC\\]"
    description:
      "> Converting a slice of a list or vector to a new list or vector."
    effect:
      ""
    modifier:
      ""
    name:
      "unslice"
    return:
      "TC\\[T $S @D\\] $pre @DL"
    typeArgs:
    - "TC : Qualified \\-\\> Unqualified"
    - "T : Unqualified"
    - "$S"
    - "@D"
    - "@DL"
- function:
    args:
    - modifier:
        ""
      name:
        "x1"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> The logical xor of the given two booleans."
    effect:
      ""
    modifier:
      ""
    name:
      "xor"
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
        "x1"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x2"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> The logical or of the given two booleans."
    effect:
      ""
    modifier:
      ""
    name:
      "\\|"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
