# Type Level Expressions

In this section, the syntax that is used for expressing types and kinds in ZK-SecreC is described.

## Unqualified types

Bounded integer types are written in the form `uint[`*N*`]` where *N* is either an integer literal or a type level variable (type synonym). The value of *N* is the modulus that bounds the values of this type. The unbounded integer type is written as `uint`. Similarly, bounded boolean types are written in the form `bool[`*N*`]`, with the same restriction imposed to *N*, and the unbounded boolean type is written as `bool`.

Note that, internally, ZK-SecreC handles unbounded types as bounded by infinity. This sometimes reflects in the error messages. For example, an error message

`Unsolved constraints: inf ~ 1030307`

means that an expression of the unbounded integer or boolean type was used where type `uint[1030307]` or `bool[1030307]` was expected (or vice versa).

The string type is denoted as `string`. The unit type is denoted as `()`. These types do not depend on a modulus.

For any qualified type *q*, the list type and vector type with elements of type *q* are written as `list[`*q*`]` and `arr[`*q*`]`, respectively. Whenever *q*<sub>1</sub>,...,*q*<sub>*n*</sub> are qualified types, `tuple[`*q*<sub>1</sub>`,`...`,`*q*<sub>*n*</sub>`]` denotes the tuple type with component types *q*<sub>1</sub>, ..., *q*<sub>*n*</sub>. Struct types are expressed via their names, along with a comma-separated list of type arguments in brackets if necessary.

Although in the signature of a function, arguments are written in the form of a comma-separated sequence, the type of the function is treated as that of the curried form. For instance, a function that assumes two arguments of type *q* and returns a value of type *r* has type *q*→*q*→*r*.

## Qualified types

For easy distinguishing, stage qualifiers are prefixed by the dollar sign. So the pre stage and the post stage are denoted by `$pre` and `$post`, respectively. Similarly, domain qualifiers are prefixed by the at sign. So the possible domains are written as `@prover`, `@verifier` and `@public`.

A qualified type is denoted by a triple where the stage and the domain qualifier (in this order) follow the unqualified type. No commas or delimiters are used. For example, `list[uint[1030307] $post @prover] $pre @public` stands for the type of lists of elements of the finite field of size 1030307 in the circuit, originated from the prover, whereby the list structure is known to the compiler (public).

Domains can interact with stages in ways that can initially be unintuitive. For example, lists with elements in the stage `$post` must be in the domain `@public` because list elements occur in the circuit, each on its own wire, and the number of wires is publicly visible. For similar reason, loops that produce values in the stage `$post` must have loop bounds in the domain `@public`. In general, all operations with values in the stage `$post` appear on the relation and the size of the relation should only depend on the program and public constants. More precise information can be found in the [Type System](5-type-system.html) subsection of this documentation.

ZK-SecreC allows omitting one qualifier or both from a type expression while maintaining its meaning as a fully qualified type. If the stage qualifier is omitted then it is inferred, whereas an omitted domain qualifier is assumed to be `@public`. For instance, type expression `list[uint[1030307] $post @prover]` denotes the same qualified list type as the one above since lists are qualified by `$pre` ineluctably and `@public` coincides with the default domain qualifier.

## Variables

ZK-SecreC allows types and functions to have type parameters. Global type level variables (type synonyms) can also be defined. By convention, names of type level variables are capitalized. Names of variables that denote a stage or a domain are prefixed by dollar and at, respectively.

## Application

Application of a type level function to its arguments is written in standard way, the function followed by the arguments. Type arguments are written as a comma-separated list in brackets.

## Kinds

Kinds are types of types. ZK-SecreC supports the following primitive kinds:

| Kind          | Types in the kind
|---------------|----------------------------------------------
| `Nat`         | Type-level natural numbers (including `inf`)
| `Stage`       | `$pre`, `$post`
| `Domain`      | `@prover`, `@verifier`, `@public`
| `Unqualified` | Unqualified types
| `Qualified`   | Qualified types

Whenever *k*<sub>1</sub> and *k*<sub>2</sub> are kinds, *k*<sub>1</sub>→*k*<sub>2</sub> is the kind of type functions that map types of kind *k*<sub>1</sub> to types of kind *k*<sub>2</sub>. For instance, `uint` has kind `Nat`→`Unqualified` (recall that, internally, the unbounded integer type is expressed as `uint[inf]`) and `list` has kind `Qualified`→`Unqualified`.

## Type predicates

Type predicates establish properties of types. Type predicates can assume zero or more type arguments. Type predicates are used for imposing type-level restrictions within particular code fragments.

Roughly, type predicates can be divided into three groups:

1. Those that reflect a restriction originating from ZK requirements and agreements. For instance, `<=` at the type level is used for denoting the subtyping order of domains; so `@public <= @prover` reflects the fact that the prover domain has higher privacy than the public domain.
1. Those that classify types according to some inherent structural property. For instance, the type predicate `Array` is true on type-level functions (of kind `Qualified`→`Unqualified`) that construct types of linear-shaped data structures of elements of a fixed type (which is the argument of the function); more precisely, the type predicate `Array` holds for type-level functions `list` and `arr`. For another instance, the type predicate `Sized` holds on data types containing data of fixed size, i.e., primitive data types and types that contain tuples or structs of sized types (but not lists or vectors).
1. Those that express assumptions whose validity or non-validity is established by the CCC file along with which the program is compiled. For instance, `Field` is a type predicate that holds if its argument type is a modulus that is allowed as a size of field by CCC. A program that requires such type predicates to hold may be type correct but still fail to compile if these requirements are not supported by CCC.

ZK-SecreC has the following builtin type predicates:

| Type predicate     | Arity | Group | Meaning
|--------------------|-------|-------|--------
| <=                 |   2   |   1   | subdomain relation
| pre                |   1   |   1   | being `$pre`
| post               |   1   |   1   | being `$post`
| Array              |   1   |   2   | producing types of linear-shaped data structures of elements of a fixed type
| Sized              |   1   |   2   | containing data of fixed size
| Field              |   1   |   3   | being allowed as a field
| Challenge          |   1   |   3   | challenge generation being allowed for the field
| Convertible        |   2   |   3   | conversion from one field to another being allowed
| ObliviousChoice    |   0   |   3   | the `disjunction` plugin of Circuit-IR being supported
| PermutationCheck   |   0   |   3   | the `permutation_check` plugin of Circuit-IR being supported
| ExtendedArithmetic |   0   |   3   | the `extended_arithmetic` plugin of Circuit-IR being supported
| Vectors            |   0   |   3   | the `vectors` plugin of Circuit-IR being supported
| Vectorization      |   0   |   3   | operations taking advantage from wire ranges being used

The `Vectorization` predicate is exceptional among the 0-ary predicates in the sense that its validity does not strictly need the presence of any Circuit-IR plugin. The predicate must be declared whenever some operations that involve vectors are used in the ZK-SecreC code, but the code can be compiled even if the `iter` plugin that provides vectorized operations is not supported. In such case, the operations with vectors are simply unrolled.

ZK-SecreC does not support user-defined type predicates.
