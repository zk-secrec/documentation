---
api:
- module:
    "Std"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "string $pre @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "string $pre @D"
    constraints:
    description:
      "> Synonym for string append."
    effect:
      ""
    modifier:
      ""
    name:
      "\\+\\+"
    return:
      "string $pre @D"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> True iff all elements of the given list with boolean elements are true."
    effect:
      ""
    modifier:
      ""
    name:
      "all"
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
        "xs"
      type:
        "list\\[bool\\[N\\] $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    description:
      "> True iff all elements of the given list with boolean elements in `$pre` are true."
    effect:
      ""
    modifier:
      ""
    name:
      "all\\_pre"
    return:
      "bool\\[N\\] $pre @D"
    typeArgs:
    - "@D"
    - "@D1"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> True iff at least one element of the given list with boolean elements is true."
    effect:
      ""
    modifier:
      ""
    name:
      "any"
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
        "xs"
      type:
        "list\\[bool\\[N\\] $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    description:
      "> True iff at least one element of the given list with boolean elements in `$pre` is true."
    effect:
      ""
    modifier:
      ""
    name:
      "any\\_pre"
    return:
      "bool\\[N\\] $pre @D"
    typeArgs:
    - "@D"
    - "@D1"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "list\\[T\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "list\\[T\\] $pre @public"
    constraints:
    description:
      "> Concatenating of two lists."
    effect:
      ""
    modifier:
      ""
    name:
      "append"
    return:
      "list\\[T\\] $pre @public"
    typeArgs:
    - "T : Qualified"
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
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    - "Convertible\\[M,N\\]"
    description:
      "> Choice between two booleans. Oblivious in `$post @prover`, evaluating both branches."
    effect:
      "* -> * -> * -> * ! <$S>"
    modifier:
      ""
    name:
      "bool\\_cond"
    return:
      "bool\\[N\\] $S @D"
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
        "b"
      type:
        "bool\\[N\\] $pre @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Downcasting the elements of the given list of booleans in the stage `$pre` into the given stage. If the given stage is `$pre` then does nothing, otherwise applies `wire`."
    effect:
      "* -> * ! <$S>"
    modifier:
      ""
    name:
      "bool\\_downcast"
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
        "bool\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Ensuring that the elements of the given list of booleans are in `$post`. If they are then does nothing, otherwise applies `wire`."
    effect:
      ""
    modifier:
      ""
    name:
      "bool\\_ensure\\_post"
    return:
      "bool\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[bool\\[N\\] $pre @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Putting the elements of the given list with boolean elements in `$pre` on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "bool\\_list\\_to\\_post"
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
        "xs"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Converting the elements of the given list of booleans to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "bool\\_list\\_to\\_pre"
    return:
      "list\\[bool\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Converting the elements of the given list of booleans to the domain `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "bool\\_list\\_to\\_prover"
    return:
      "list\\[bool\\[N\\] $S @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[bool\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Converting the elements of the given list of booleans to integers."
    effect:
      ""
    modifier:
      ""
    name:
      "bool\\_list\\_to\\_uint"
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
        "xss"
      type:
        "list\\[list\\[T\\] $pre @public\\] $pre @public"
    constraints:
    description:
      "> Concatenating of all element lists of the given list of lists. Assumes that all element lists have the same length."
    effect:
      ""
    modifier:
      ""
    name:
      "concat"
    return:
      "list\\[T\\] $pre @public"
    typeArgs:
    - "T : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "xss"
      type:
        "list\\[list\\[T\\] $pre @public\\] $pre @public"
    constraints:
    description:
      "> Concatenating of all element lists of the given list of lists."
    effect:
      ""
    modifier:
      ""
    name:
      "concat\\_non\\_rectangle"
    return:
      "list\\[T\\] $pre @public"
    typeArgs:
    - "T : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "bool\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "b"
      type:
        "bool\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion, provided that the given condition is true."
    effect:
      ""
    modifier:
      ""
    name:
      "conditional\\_assert"
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
        "c"
      type:
        "bool\\[N\\] $post @D"
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $post @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion of equality to zero, provided that the given condition is true."
    effect:
      ""
    modifier:
      ""
    name:
      "conditional\\_assert\\_zero"
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
        "l"
      type:
        "list\\[X\\] $pre @public"
    - modifier:
        ""
      name:
        "p"
      type:
        "X \\-\\> bool\\[N\\] $S @D"
    constraints:
    description:
      "> The number of elements satisfying the given predicate in the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "count"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "X : Qualified"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "l"
      type:
        "list\\[T $pre @D\\] $pre @D"
    - modifier:
        ""
      name:
        "p"
      type:
        "T $pre @D \\-\\> bool\\[N\\] $pre @D1"
    constraints:
    description:
      "> The number of elements satisfying the given predicate in the given list with elements in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "count\\_pre"
    return:
      "uint\\[N\\] $pre @D1"
    typeArgs:
    - "T : Unqualified"
    - "N : Nat"
    - "@D"
    - "@D1"
- function:
    args:
    - modifier:
        ""
      name:
        "amounts"
      type:
        "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    constraints:
    description:
      "> Replacing of each element of the given list of numbers with the corresponding index replicated that many times."
    effect:
      ""
    modifier:
      ""
    name:
      "duplicate\\_indices"
    return:
      "list\\[uint\\[18446744073709551616\\] $pre @public\\] $pre @public"
    typeArgs:
- function:
    args:
    - modifier:
        ""
      name:
        "a"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "b"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> Logical equivalence."
    effect:
      ""
    modifier:
      ""
    name:
      "equiv"
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
        "msg"
      type:
        "string $pre @D"
    constraints:
    description:
      "> Halting immediately with an assertion failure."
    effect:
      ""
    modifier:
      ""
    name:
      "error"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "B \\-\\> A \\-\\> B"
    - modifier:
        ""
      name:
        "x"
      type:
        "B"
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[A\\] $pre @public"
    constraints:
    description:
      "> The polymorphic left fold of the given list with the given operation and the given initial value."
    effect:
      ""
    modifier:
      ""
    name:
      "foldl"
    return:
      "B"
    typeArgs:
    - "A : Qualified"
    - "B : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "B $SB @DB \\-\\> T $pre @D \\-\\> B $SB @DB"
    - modifier:
        ""
      name:
        "x"
      type:
        "B $SB @DB"
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[T $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    description:
      "> The polymorphic left fold of list with elements in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "foldl\\_pre"
    return:
      "B $SB @DB"
    typeArgs:
    - "B : Unqualified"
    - "$SB"
    - "@DB"
    - "T : Unqualified"
    - "@D"
    - "@D1"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "A \\-\\> B \\-\\> B"
    - modifier:
        ""
      name:
        "x"
      type:
        "B"
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[A\\] $pre @public"
    constraints:
    description:
      "> The polymorphic right fold of the given list with the given operation and the given initial value."
    effect:
      ""
    modifier:
      ""
    name:
      "foldr"
    return:
      "B"
    typeArgs:
    - "A : Qualified"
    - "B : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "T $pre @D \\-\\> B \\-\\> B"
    - modifier:
        ""
      name:
        "x"
      type:
        "B"
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[T $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    description:
      "> The polymorphic right fold of list with elements in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "foldr\\_pre"
    return:
      "B"
    typeArgs:
    - "B : Qualified"
    - "T : Unqualified"
    - "@D"
    - "@D1"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[T\\] $pre @public"
    - modifier:
        ""
      name:
        "l"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Splitting of elements of the given list into groups of the given length."
    effect:
      ""
    modifier:
      ""
    name:
      "group"
    return:
      "list\\[list\\[T\\] $pre @public\\] $pre @public"
    typeArgs:
    - "T : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "x"
      type:
        "T"
    constraints:
    description:
      "> The polymorphic identity function."
    effect:
      ""
    modifier:
      ""
    name:
      "id"
    return:
      "T"
    typeArgs:
    - "T : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "a"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "b"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    description:
      "> Logical implication."
    effect:
      ""
    modifier:
      ""
    name:
      "impli"
    return:
      "bool\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        "ref"
      name:
        "xs"
      type:
        "list\\[Q\\] $pre @D"
    - modifier:
        ""
      name:
        "x"
      type:
        "Q"
    constraints:
    description:
      "> Appending the given element to the end of the given list."
    effect:
      "[*] -> * -> * ! <@D>"
    modifier:
      "extern"
    name:
      "list\\_push"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "Q : Qualified"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[T $pre @D\\] $pre @D"
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Truncating the given list at the given public length."
    effect:
      ""
    modifier:
      ""
    name:
      "list\\_to\\_public\\_length"
    return:
      "list\\[T $pre @D\\] $pre @public"
    typeArgs:
    - "T : Unqualified"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "T \\-\\> U"
    - modifier:
        ""
      name:
        "l"
      type:
        "list\\[T\\] $pre @public"
    constraints:
    description:
      "> The polymorphic map of elements of the given list with the given function."
    effect:
      ""
    modifier:
      ""
    name:
      "map"
    return:
      "list\\[U\\] $pre @public"
    typeArgs:
    - "T : Qualified"
    - "U : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    constraints:
    description:
      "> Merging two lists that are assumed to be sorted into a new sorted list."
    effect:
      ""
    modifier:
      ""
    name:
      "merge"
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
        "n"
      type:
        "uint $pre @public"
    constraints:
    - "Field\\[P\\]"
    - "Challenge\\[P\\]"
    description:
      "> Generating a list of the given length and consisting of random non-zero field elements."
    effect:
      "* -> [*] ! <@public>"
    modifier:
      ""
    name:
      "nonzero\\_challenge"
    return:
      "list\\[uint\\[P\\] $pre @verifier\\] $pre @public"
    typeArgs:
    - "P : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @D"
    - modifier:
        ""
      name:
        "n"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    description:
      "> Truncating the given list with elements in `$pre` at the given public length and converting the result to a vector on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "pre\\_uint\\_list\\_to\\_post\\_array"
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
        "xs"
      type:
        "A\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Array\\[A\\]"
    description:
      "> Product of all elements of the given list or vector."
    effect:
      ""
    modifier:
      ""
    name:
      "prod"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
    - "A : Qualified \\-\\> Unqualified"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "A\\[uint\\[N\\] $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    - "Array\\[A\\]"
    description:
      "> Product of all elements of the given list or vector with elements in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "prod\\_pre"
    return:
      "uint\\[N\\] $pre @D"
    typeArgs:
    - "@D"
    - "@D1"
    - "N : Nat"
    - "A : Qualified \\-\\> Unqualified"
- function:
    args:
    - modifier:
        ""
      name:
        "l"
      type:
        "list\\[X\\] $pre @public"
    constraints:
    description:
      "> The given list reversed."
    effect:
      ""
    modifier:
      ""
    name:
      "reverse"
    return:
      "list\\[X\\] $pre @public"
    typeArgs:
    - "X : Qualified"
- function:
    args:
    - modifier:
        ""
      name:
        "l"
      type:
        "list\\[T $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    description:
      "> The given list with elements in `$pre` reversed."
    effect:
      ""
    modifier:
      ""
    name:
      "reverse\\_pre"
    return:
      "list\\[T $pre @D\\] $pre @D1"
    typeArgs:
    - "T : Unqualified"
    - "@D"
    - "@D1"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "ys"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    - modifier:
        ""
      name:
        "lim"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    description:
      "> Scalar (dot) product of the initial parts of the given two lists up to the given position."
    effect:
      ""
    modifier:
      ""
    name:
      "scalar\\_prod"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    constraints:
    description:
      "> Merge sort of the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "sort"
    return:
      "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Sum of squares of all elements of the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "sq\\_sum"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "A\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Array\\[A\\]"
    description:
      "> Sum of all elements of the given list or vector."
    effect:
      ""
    modifier:
      ""
    name:
      "sum"
    return:
      "uint\\[N\\] $S @D"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
    - "A : Qualified \\-\\> Unqualified"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "A\\[uint\\[N\\] $pre @D\\] $pre @D1"
    constraints:
    - "@D1 \\<= @D"
    - "Array\\[A\\]"
    description:
      "> Sum of all elements of the given list or vector with elements in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "sum\\_pre"
    return:
      "uint\\[N\\] $pre @D"
    typeArgs:
    - "@D"
    - "@D1"
    - "N : Nat"
    - "A : Qualified \\-\\> Unqualified"
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
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "y"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    - "Convertible\\[M,N\\]"
    description:
      "> Choice between two integers. Oblivious in `$post @prover`, evaluating both branches."
    effect:
      "* -> * -> * -> * ! <$S>"
    modifier:
      ""
    name:
      "uint\\_cond"
    return:
      "uint\\[N\\] $S @D"
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
        "n"
      type:
        "uint\\[N\\] $pre @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Downcasting the elements of the given list of integers in the stage `$pre` into the given stage. If the given stage is `$pre` then does nothing, otherwise applies `wire`."
    effect:
      "* -> * ! <$S>"
    modifier:
      ""
    name:
      "uint\\_downcast"
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
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Ensuring that the elements of the given list of integers are in `$post`. If they are then does nothing, otherwise applies `wire`."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_ensure\\_post"
    return:
      "uint\\[N\\] $post @D"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Putting the elements of the given list with integral elements in `$pre` on wires."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_list\\_to\\_post"
    return:
      "list\\[uint\\[N\\] $post @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Converting the elements of the given list of integers to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_list\\_to\\_pre"
    return:
      "list\\[uint\\[N\\] $pre @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    description:
      "> Converting the elements of the given list of integers to the domain `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_list\\_to\\_prover"
    return:
      "list\\[uint\\[N\\] $S @prover\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    constraints:
    description:
      "> An assertion failure along with an infinite loop."
    effect:
      ""
    modifier:
      ""
    name:
      "undefined"
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
        "x"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that does not depend on stage."
    effect:
      "* -> * ! <$S>"
    modifier:
      ""
    name:
      "univ\\_assert"
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
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion of equality to zero that does not depend on stage."
    effect:
      "* -> * ! <$S>"
    modifier:
      ""
    name:
      "univ\\_assert\\_zero"
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
        "c"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "b"
      type:
        "bool\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion, provided that the given condition is true. Does not depend on stage."
    effect:
      ""
    modifier:
      ""
    name:
      "univ\\_conditional\\_assert"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
    - "$S"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "c"
      type:
        "bool\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "x"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion of equality to zero, provided that the given condition is true. Does not depend on stage."
    effect:
      ""
    modifier:
      ""
    name:
      "univ\\_conditional\\_assert\\_zero"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "@D"
    - "$S"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "T1 \\-\\> T2 \\-\\> T3"
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[T1\\] $pre @D"
    - modifier:
        ""
      name:
        "ys"
      type:
        "list\\[T2\\] $pre @D"
    constraints:
    description:
      "> The polymorphic zip of corresponding elements of two lists with the given operation. The lists must be of the same length."
    effect:
      ""
    modifier:
      ""
    name:
      "zip\\_with"
    return:
      "list\\[T3\\] $pre @D"
    typeArgs:
    - "T1 : Qualified"
    - "T2 : Qualified"
    - "T3 : Qualified"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "f"
      type:
        "T1 \\-\\> T2 \\-\\> T3"
    - modifier:
        ""
      name:
        "xs"
      type:
        "list\\[T1\\] $pre @D"
    - modifier:
        ""
      name:
        "ys"
      type:
        "list\\[T2\\] $pre @D"
    - modifier:
        ""
      name:
        "lim"
      type:
        "uint\\[18446744073709551616\\] $pre @D"
    constraints:
    description:
      "> The polymorphic zip of corresponding elements of two lists with the given operation, up to the given position."
    effect:
      ""
    modifier:
      ""
    name:
      "zip\\_with\\_upto"
    return:
      "list\\[T3\\] $pre @D"
    typeArgs:
    - "T1 : Qualified"
    - "T2 : Qualified"
    - "T3 : Qualified"
    - "@D"
...
