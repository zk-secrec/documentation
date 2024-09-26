---
api:
- module:
    "Prob"
- function:
    args:
    - modifier:
        ""
      name:
        "prob\\_log"
      type:
        "uint $pre @public"
    - modifier:
        ""
      name:
        "trustability\\_exponent"
      type:
        "uint $pre @public"
    constraints:
    description:
      "> The number of times a computation must be repeated in order to achieve error probability less than the reciprocal of 2 raised to the power given as the second argument, provided that each iteration succeeds with error probability less than the reciprocal of 2 raised to the power of the first argument."
    effect:
      ""
    modifier:
      ""
    name:
      "repetition\\_times"
    return:
      "uint\\[18446744073709551616\\] $pre @public"
    typeArgs:
...
