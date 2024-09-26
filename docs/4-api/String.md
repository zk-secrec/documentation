---
api:
- module:
    "String"
- function:
    args:
    - modifier:
        ""
      name:
        "xs"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "r"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The value of the given String object if interpreted as a big-endian representation on base given as the second argument. Only the characters within the declared length are taken into account."
    effect:
      ""
    modifier:
      ""
    name:
      "eval\\_string"
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
        "x"
      type:
        "String\\[$post, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "String\\[$post, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "maxLen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the String objects in `$post` given as the first two arguments have a common declared length and are equal within this length. The third argument is a public value that is assumed to be an upper bound of the common length and a lower bound of the actual lengths of the internal lists of characters."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_assert\\_eq"
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
        "x"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "maxLen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the String objects given as the first two arguments have a common declared length and are equal within this length. The third argument is a public value that is assumed to be an upper bound of the common length and a lower bound of the actual lengths of the internal lists of characters if the String is in `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_eq"
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
        "String\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "String\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[N\\] $post @prover"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the String objects in `$post` `@prover` given as the first two arguments are equal up to the number of characters given as the `$post` `@prover` value in the third argument. Assumes that the actual length of the internal list of characters of the first String object does not exceed that of the second String object."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_eq\\_up\\_to\\_len"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "str"
      type:
        "String\\[$pre, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "start"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[N\\] $pre @D"
    - modifier:
        ""
      name:
        "maxLen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    - "PConTestChallenge\\[N\\]"
    description:
      "> The String object that consists of characters in the String object in `$pre` given as the first argument, starting from the position given as the second argument and having declared length given in the third argument. The fourth argument is a public upper bound of the lengths in use. Fails if the required substring extends over the declared length of the given string."
    effect:
      "[[*],*] -> * -> * -> * -> [[*],*] ! <@public>"
    modifier:
      ""
    name:
      "string\\_substring"
    return:
      "String\\[$pre, @D, N\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "str"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "start"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "len"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "maxLen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $S, @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Vectorization"
    - "PConTestChallenge\\[N\\]"
    description:
      "> The String object that consists of characters in the String object given as the first argument, starting from the position given as the second argument and having declared length given in the third argument. The fourth argument is a public upper bound of the lengths in use and the fifth argument is a Sizeasserter object with a number of bits to fit all lengths if the String is in `$post` `@prover`. Fails if the required substring extends over the declared length of the given string."
    effect:
      "[[*],*] -> * -> * -> * -> [*,*,[*]] -> [[*],*] ! <@public>"
    modifier:
      ""
    name:
      "string\\_substring3"
    return:
      "String\\[$S, @D, N\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "str"
      type:
        "String\\[$pre, @D, N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of a String object in `$pre` to a String object in `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_to\\_post"
    return:
      "String\\[$post, @D, N\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "str"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    constraints:
    description:
      "> Conversion of any String object to a String object in `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_to\\_pre"
    return:
      "String\\[$pre, @D, N\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "str"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    constraints:
    description:
      "> Conversion of any String object to a String object in the domain `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_to\\_prover"
    return:
      "String\\[$S, @prover, N\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "s"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "l"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The value of the given String object if interpreted as a big-endian representation on base 256. The characters beyond the declared length are interpreted as zeros. The second argument is assumed to be a public upper bound of the declared length and a lower bound of the actual length of the internal character list."
    effect:
      ""
    modifier:
      ""
    name:
      "string\\_to\\_uint"
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
        "bytes"
      type:
        "list\\[uint\\[N\\] $S @D\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> The String object that consists of all characters in the given list, with the declared length being the actual length of the given list."
    effect:
      "[*] -> [[*],*] ! <$S>"
    modifier:
      ""
    name:
      "string\\_with\\_native\\_len"
    return:
      "String\\[$S, @D, N\\] $pre @public"
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
        "maxlen"
      type:
        "uint\\[18446744073709551616\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> A String object whose value, when interpreted as a big-endian representation on base 256, is the number given as the first argument. The second argument becomes the actual length of the internal character list. The declared length excludes precisely the trailing zeros of the character list."
    effect:
      ""
    modifier:
      ""
    name:
      "uint\\_to\\_string"
    return:
      "String\\[$S, @D, N\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
...
