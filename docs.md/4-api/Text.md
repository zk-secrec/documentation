---
api:
- module:
    "Text"
- function:
    args:
    - modifier:
        ""
      name:
        "str"
      type:
        "list\\[uint\\[N\\] $pre @D\\] $pre @D"
    constraints:
    description:
      "> The partial match table (also known as prefix function) of the Knuth-Morris-Pratt algorithm for the given list."
    effect:
      ""
    modifier:
      ""
    name:
      "prefixfn"
    return:
      "list\\[uint\\[N\\] $pre @D\\] $pre @D"
    typeArgs:
    - "N : Nat"
    - "@D"
...
