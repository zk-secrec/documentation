---
api:
- module:
    "EC"
- function:
    args:
    - modifier:
        ""
      name:
        "z"
      type:
        "list\\[bool\\[2\\] $post @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "pk"
      type:
        "ECPointNZ\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "S"
      type:
        "ECPointNZ\\[N, $post, @prover\\] $pre @public"
    - modifier:
        ""
      name:
        "fixpowers"
      type:
        "list\\[list\\[UECPointNZ\\[@public\\] $pre @public\\] $pre @public\\] $pre @public"
    - modifier:
        "ref"
      name:
        "sizeasserters"
      type:
        "list\\[SizeAsserter\\[N, $post, @prover\\] $pre @public\\] $pre @public"
    constraints:
    - "Field\\[N\\]"
    - "Convertible\\[2,N\\]"
    description:
      "> This function can be used to check that an [ECDSA signature](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm), defined over the [P-384 curve](https://en.wikipedia.org/wiki/P-384), is valid. The arguments to the function are (1) the digest of the message that has been signed, given as the sequence of booleans (i.e. bits) over modulus 2, (2) the public key, which is a point on the elliptic curve, given as a pair of big integers (see `BigInt.zksc`), (3) the signature, which is a pair of exponents, given as a pair of big integers, (4) some precomputed powers of the generator of the elliptic curve group, and (5) the size asserters. The precomputed powers are computed with the function `compute_fixpowers` in this module. The function asserts that the signature verifies successfully. The function has been tested (only) with the modulus `N` for the arithmetic circuit being equal to the Mersenne prime M61."
    effect:
      ""
    modifier:
      ""
    name:
      "assert\\_checksig"
    return:
      "\\(\\) $pre @public"
    typeArgs:
    - "N : Nat"
- function:
    args:
    constraints:
    description:
      "> Computes certain powers of the generator of the P-384 elliptic curve group. These powers are used as constants during the computations for the ECDSA signature verification. One may invoke `compute_fixpowers` once, and use its result for the verification of several signatures."
    effect:
      ""
    modifier:
      ""
    name:
      "compute\\_fixpowers"
    return:
      "list\\[list\\[UECPointNZ\\[@public\\] $pre @public\\] $pre @public\\] $pre @public"
    typeArgs:
...
