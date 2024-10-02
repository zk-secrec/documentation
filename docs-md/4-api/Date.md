---
api:
- module:
    "Date"
- function:
    args:
    - modifier:
        ""
      name:
        "year"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "month"
      type:
        "uint\\[N\\] $S @D"
    - modifier:
        ""
      name:
        "day"
      type:
        "uint\\[N\\] $S @D"
    constraints:
    description:
      "> A Date object with given year, month and day."
    effect:
      ""
    modifier:
      ""
    name:
      "date"
    return:
      "Date\\[$S, @D, N\\] $pre @public"
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
        "Date\\[$post, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "y"
      type:
        "Date\\[$post, @D, N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that given two Date objects have equal values."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_assert\\_eq"
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
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first given date is later than or equal to the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_assert\\_ge"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first given date is later than the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_assert\\_gt"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first given date is earlier than or equal to the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_assert\\_le"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Assertion that the first given date is earlier than the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_assert\\_lt"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$S, @D, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$S, @D, N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test of equality of the values of given two Date objects."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_eq"
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
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given date is later than or equal to the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_ge3"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given date is later than the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_gt3"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given date is earlier than or equal to the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_le3"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "xd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        ""
      name:
        "yd"
      type:
        "Date\\[$post, @prover, N\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserter"
      type:
        "SizeAsserter\\[N, $post, @prover\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Test if the first given date is earlier than the second one. The third argument must be a SizeAsserter object suitable for comparing Date objects. Assumes that the given Date objects encode correct dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_lt3"
    return:
      "bool\\[N\\] $post @prover"
    typeArgs:
    - "N : Nat"
- function:
    args:
    constraints:
    - "Field\\[N\\]"
    description:
      "> A new SizeAsserter object suitable for comparing Date objects."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_sizeasserter\\_new"
    return:
      "SizeAsserter\\[N, $S, @D\\] $pre @public"
    typeArgs:
    - "N : Nat"
    - "$S"
    - "@D"
- function:
    args:
    - modifier:
        ""
      name:
        "d"
      type:
        "Date\\[$pre, @D, N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given Date object in the stage `$pre` to the stage `$post`."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_to\\_post"
    return:
      "Date\\[$post, @D, N\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "d"
      type:
        "Date\\[$post, @D, N\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    description:
      "> Conversion of the given Date object in the stage `$post` to the stage `$pre`."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_to\\_pre"
    return:
      "Date\\[$pre, @D, N\\] $pre @public"
    typeArgs:
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "d"
      type:
        "Date\\[$S, @D, N\\] $pre @public"
    constraints:
    description:
      "> Conversion of the given Date object to the domain `@prover`."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_to\\_prover"
    return:
      "Date\\[$S, @prover, N\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
- function:
    args:
    - modifier:
        ""
      name:
        "date"
      type:
        "Date\\[$pre, @D, N\\] $pre @public"
    constraints:
    description:
      "> The string representation of the given Date object (for debugging). In general, the result is not ISO-8601 since zeros are not added in front of one-digit months and dates."
    effect:
      ""
    modifier:
      ""
    name:
      "date\\_to\\_string"
    return:
      "string $pre @D"
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
    - "Field\\[N\\]"
    description:
      "> Test if the given String object encodes a full date in the ISO 8601 format."
    effect:
      ""
    modifier:
      ""
    name:
      "is\\_full\\_date"
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
        "full\\_date"
      type:
        "String\\[$S, @D, N\\] $pre @public"
    constraints:
    description:
      "> The Date object encoding the date in the given String object. Assumes that the given String object encodes a correct full date in the ISO 8601 format."
    effect:
      ""
    modifier:
      ""
    name:
      "parse\\_full\\_date"
    return:
      "Date\\[$S, @D, N\\] $pre @public"
    typeArgs:
    - "$S"
    - "@D"
    - "N : Nat"
...
