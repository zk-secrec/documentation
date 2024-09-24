# Top-Level Declarations

A ZK-SecreC program is a collection of top-level declarations. The order of the declarations is not important. The declarations can be spread over many files sometimes called *modules* after modules of code in other programming languages. But please be aware that this term has a potential to be confused with modulus.

## Imports

An *import* brings names exported by another ZK-SecreC module in scope. Otherwise, names defined in a file are visible only throughout the file. For instance, the declaration

```
use Std::*;
```

imports all names exported by the ZK-SecreC module with name `Std`. To be found, the module must be in file with name `Std.zksc` either in the same directory as the calling module or in the standard library of ZK-SecreC. Despite the syntax, there is currently no way to import names one-by-one.

Names defined at the top level must be unique throughout all the program, including the imported names.

## Type definitions

One can define *type synonyms* at the top level. The kind of the defined type must be given explicitly. For instance, the declaration

```
type N : Nat = 0x1fffffffffffffff;
```

defines `N` as a new type synonym that refers to the type-level natural number expressed by the literal `0x1fffffffffffffff` (the value of this hexadecimal literal is the Mersenne prime 2<sup>61</sup>-1).

Type synonyms can take type arguments, in which case they are in principle functions on types. In a type definition, type parameters are introduced by a comma-separated list in brackets. Any formal type parameter must normally be equipped with its kind using the notation *p*`:`*k* where *p* is the parameter (a type variable) and *k* is its kind. However, parameter kinds `Stage` and `Domain` can be settled by `$` and `@`, respectively, preceding the parameter name, in which case the kind name is not written.

If the definition starts with the keyword `pub` then the defined name is exported by the module. Otherwise, the defined name is visible within the current file only, regardless of the imports occurring in other files. For instance, the library file `Std.zksc` contains the following definitions that introduce type synonyms for types of integers of 8, 16, 32, 64 and 128 bits:

```
pub type u8 : Unqualified = uint[0x100];
pub type u16 : Unqualified = uint[0x10000];
pub type u32 : Unqualified = uint[0x100000000];
pub type u64 : Unqualified = uint[0x10000000000000000];
pub type u128 : Unqualified = uint[0x100000000000000000000000000000000];
```

## Struct declarations

New struct types can also be defined at the top level. A *struct declaration* introduces the name of the struct type and lists the names of all fields of the structs in this type along with the field types. Type parameters are allowed here, too. For instance, dates are introduced in the standard library with the following struct declaration:

```
pub struct Date[$S, @D, N : Nat] { 
  year : uint[N] $S @D,
  month : uint[N] $S @D,
  day : uint[N] $S @D,
  code : uint[N] $S @D
}
```

This declaration introduces a new type with name `Date` which is parametrized in a stage `$S`, a domain `@D` and a type level natural number `N`. Each element in this type is a data structure containing four fields with names `year`, `month`, `day` and `code`. All the fields must have the same type `uint[N] $S @D`, where `N`, `$S` and `@D` are the real types associated to the type parameters. The keyword `pub` indicates that the name of the type and the names of the fields are exported.

## Function definitions

Like most programming languages, ZK-SecreC allows programmers to define functions. 

### Native functions

The usual native function definitions have the following syntax:

```
Function = 'pub'? 'sieve'? 'fn' Identifier TypeParams? '(' Params ')' RetType? Constraints? Body
RetType = '->' Type
Constraints = 'where' TypePreds
```

The modifier `pub` indicates that the function is exported from the file. Like in the case of functions defined locally, the modifier `sieve` instructs the function to be compiled as a function gate in Circuit-IR. Without the modifier, no corresponding function in Circuit-IR is created, all calls of this function are inlined, and vectorized applications of the function are impossible.

Like type parameters of type synonyms, type parameters of functions are written as a comma separated list in brackets. They introduce polymorphism, i.e., the function can be called with different types (without having to indicate the actual type arguments). The kinds of all type parameters must be explicit. In the case of stage and domain parameters, kind is reflected by the initial character (`$` or `@`, respectively). In other cases, kind must be indicated after colon like in `N : Nat`. A sieve function is not allowed to be stage polymorphic.

Ordinary parameters are written as a comma separated list in parentheses. The parameters must be given together with their types. These types can depend on the type parameters introduced earlier.

Vectorized application of user defined functions is allowed only if they have been declared as sieve functions, still sieve functions can also be applied in non-vectorized way like usual functions. Parameters of sieve functions that are called in vectorized way must have sized types in order to be put into vectors, and such sieve functions must have at least one parameter. If a sieve function is only called in non-vectorized way then arguments and result values can also be lists whose length is in the public domain. Such function is allowed to have no parameters.

The result of applying a sieve function partially non-vectorized is considered a new sieve function:

```
sieve fn f(x : uint[N] $pre @public, y : uint[N] $post @prover) where Field[N] {
  ...
}

fn main() where Field[N], Vectorization { 
  let x : uint[N] $pre @public = ...;
  let ys : arr[uint[N] $post @prover] = ...;
  let g = f(x);
  let trash : arr[() $pre @public] = g.(ys);
}
```

Note the difference between the `sieve` modifier and the `Vectorization` constraint: The former is necessary for the function to be called in vectorized way, whereas the latter is required for the function to be able to call other functions in vectorized way.

A function parameter can be preceded by the keyword `ref`, in which case it is a pass-by-reference parameter, i.e., mutable in the body of the function. Parameters without the keyword `ref` are immutable.

A function with no return type given is assumed to have the return type `()`.

A function may have constraints imposed on its type. If any, constraints are written as a comma-separated list of type predicates after the keyword `where`. Each type predicate is a condition imposed on types. Standard examples are `@D <= @verifier` and `Field[N]`. The former requires the domain-kinded type variable `@D` to be `@verifier` at highest, i.e., either `@public` or `@verifier`. The latter requires `N` to be a modulus allowed by the associated CCC file as a field. Note that type predicates do not have to mention type parameters of the function. For instance, `N` in the last example may be defined as an integer constant outside the function, and even can be replaced with an integer literal in the predicate. Constraints such as `ObliviousChoice` and `Vectorization` do not have a parameter at all. Such predicates are reasonable as their truth value can depend on a CCC file which is not part of the ZK-SecreC program.

The body of a function must be a block.

Throughout the program (including imported modules), there must be exactly one function with name `main`. The program starts execution from the body of this function. The type of the main function must not contain free type variables, except those of kind `Nat`.

### Foreign functions

One can call Rust functions in ZK-SecreC. To this end, the Rust function must be given a corresponding signature in ZK-SecreC. The signature of a foreign function has the same shape as that of a native function, but the keyword `extern` must occur immediately before the keyword `fn`. The body must be omitted, e.g.,

`extern fn sqr[@D](x : u64 $pre @D) -> u64 $pre @D;`

A foreign function cannot be declared as `sieve`.

The Rust functions must be implemented in a Rust file. The `-e` parameter of runrust specifies the Rust file that implements the foreign functions declared in the ZK-SecreC file. Any Rust compiler errors from that Rust file will reference `src/Rust/zksc-app-lib/src/externs.rs`, which is where the Rust file is copied to, but the line numbers in the error messages are correct.

The following table shows the correspondence between ZK-SecreC and Rust types; here `T'` denotes the Rust type corresponding to the ZK-SecreC type `T`:

ZK-SecreC              | Rust
-----------------------|----------------------------------------------------
`() $pre @D`           | `()`
`bool $pre @D`         | `bool`
`bool[N] $pre @D`      | `bool`
`u8 $pre @D`           | `u8`
`u16 $pre @D`          | `u16`
`u32 $pre @D`          | `u32`
`u64 $pre @D`          | `u64`
`u128 $pre @D`         | `u128`
`uint $pre @D`         | `BigInt`
`uint[N] $pre @D`      | `Value` if `N` is finite and other than 2<sup>*n*</sup> with *n*=8,16,32,64,128
`string $pre @D`       | `String`
`T : Qualified`        | `Value`
`list[() $pre @D]`     | `Value`
`arr[() $pre @D]`      | `Value`
`list[T] or arr[T]`    | `Vec<T'>` if `T'` is `bool`, `u8`, `u16`, `u32`, `u64`, `u128`
`list[T] or arr[T]`    | `Vec<Value>` if `T'` is not `()`, `bool`, `u8`, `u16`, `u32`, `u64`, `u128`
`tuple[T1,T2]`         | `(T1',T2')` if not a pass-by-reference argument
`tuple[T1,T2,T3]`      | `(T1',T2',T3')` if not a pass-by-reference argument
`tuple[T1,T2,T3,T4]`   | `(T1',T2',T3',T4')` if not a pass-by-reference parameter
`tuple[T1,T2,T3,T4,T5]`| `(T1',T2',T3',T4',T5')` if not a pass-by-reference parameter
`tuple[T1,...,Tn]`     | `Box<[Value]>`
`struct`               | `Box<[Value]>`
`store[T1,T2] $S @D`   | `Value`

For non-primitive Rust types other than tuples, i.e. for `Value`, `Vec`, `Box`, `BigInt`, `String`,
the Rust type must be prefixed by `&` when used for an argument of an foreign function (e.g. `&Value` instead of `Value`) but not when used for a return value. The prefix is also used inside tuples (e.g. (`&Value`, `&BigInt`)). Primitive Rust types and Rust tuples are not prefixed when used as non-ref parameters.

For pass-by-reference parameters, the prefix is `&mut`. Rust tuples (e.g. (`&mut Value`, `&mut BigInt`)) cannot be used for pass-by-reference parameters, instead `&mut Box<[Value]>` (or `&mut Value`) must be used regardless of the number of components. Primitive Rust types are prefixed with `&mut` when used as pass-by-reference parameters.

All the prefixed (borrowed) values can be cloned (using the method `clone()` in Rust) to get the non-prefixed (owned) value. This cloning is constant-time for `Value` (only increasing the reference count) but makes a copy of the whole data structure for `Vec`, `Box`, `BigInt`, and `String`. To avoid this copying, it is also possible to use `Value` (`&Value` for pass-by-value parameters, `&mut Value` for pass-by-reference parameters) instead of these types when defining the Rust function. The `Value`, `&Value`, and `&mut Value` can be converted to/from the corresponding Rust types using the `From` and `Into` traits.

The `into()` method is essential when implementing external functions on multidimensional lists/arrays or lists/arrays of tuples/BigInts/strings, as lists/arrays with non-primitive elements are always represented as `Vec<Value>` and the `into()` method needs to be used to convert the elements to/from the corresponding Rust types. It is also needed for tuples translated as `Box<[Value]>`.

Slices cannot be passed to foreign functions. They can be removed (copying the elements of the slice to a new list/array) using the builtin function `unslice` (e.g., `unslice(xs[1..])` instead of `xs[1..]`).

### Implementing external Rust functions

The module `crate::externs_header`, which re-exports some essential types, needs to be imported in every Rust file implementing functions used as ZK-SecreC foreign functions:

`use crate::externs_header::*;`

External function implementations must use the `pub` keyword, so that they can be used from the ZK-SecreC code. The first two parameters must be of types `&ContextRef` and `&mut Stack`, the variables can be `_` as they are usually not needed. The next parameters are the type parameters (other than `Unqualified`) of the ZK-SecreC function, the Rust type depends on the kind of the ZK-SecreC type parameter according to the following table:

ZK-SecreC     | Rust
--------------|----------------------
domain (`@`)  | `DomainType`
stage (`$`)   | `StageType`
`Nat`         | `&NatType`
`Qualified`   | `QualifiedType`
`Unqualified` | (no parameter)

After that, there will be the ordinary parameters of the ZK-SecreC function.

For the example foreign function `sqr`, we can have the following Rust implementation:

```
pub fn sqr(_: &ContextRef, _: &mut Stack, _d: DomainType, x: u64) -> u64 {
  x * x
}
```

Here, we have `_d: DomainType` corresponding to the `@D` in ZK-SecreC and `x: u64` corresponding to `x : u64 $pre @D` in ZK-SecreC. The variable names do not have to be the same as in ZK-SecreC.

### Effect declarations

For guaranteeing preservation of privacy, static types are not enough. Besides types, the compiler of ZK-SecreC must keep track of *effects*. One can read more about effects in the [Type system](5-type-system.html) subsection. In brief, effects encode any medium (a word chosen to be maximally abstract) where an operation can cause observable changes (apart from the return value).  Here, we need to know that there are *stage effects* and *domain effects* (besides others).

In most cases, the compiler is able to infer effects, but sometimes (typically in the case of recursive functions) it fails to do it. The programmer can document effects of any functions in an *effect declaration*. If present, the effect declaration must be put directly before the function declaration. An effect declaration has the following syntax:

```
EffectDecl = 'unchecked' 'eff' EffType '!' Effs
Effs = Eff | Eff '+' Effs
Eff = Stage | Domain
```

Here, `EffType` is a sketch of the type of the function and `Effs` is a list of effects potentially arising during an execution of the function body. Only stage effects and domain effects can be given, with plus sign separating them. The type parameters of the function can be used in the effects.

For instance, the auxiliary function `sum` in the subsection [Getting Started](../1-user-guide/1-getting-started.html) of this documentation could have the following effect declaration:

```
unchecked eff * -> * ! $S
```

Lists and vectors can be indicated by brackets, so one could make the type sketch more precise by writing

```
unchecked eff [*] -> * ! $S
```

Similarly, a tuple type can be indicated by comma-separated sketches of the component types in brackets.

## Implementation declarations

An *implementation declaration* introduces functions associated to a struct type. It is of the form `impl` *s* `{ ... }` where *s* is a struct type name (that must be defined separately by a struct declaration) and the braces contain definitions of functions associated to the struct type. The function definitions in an implementation declaration have the same syntax and semantics as function definitions at the top level.

The designers of implementation declarations initially had the aim of introducing object-oriented features into ZK-SecreC. Functions associated to struct types should have played the role of methods. Currently, these aims are not fully implemented. Functions defined in implementation declarations cannot be called explicitly. However, as a builtin feature, the function with name `finalize`, if present in the implementation declaration, is called on each struct of that type when it goes out of scope. The function `finalize` must take one parameter which has the corresponding struct type and its return type must be `() $pre @public`.

This special feature firstly serves the aim of code modularization. A programmer can specify all boring checks concerning the struct in the finalizer where they do not disturb understanding the logic of the main functionality. Secondly, postponing all checks concerning a data item to the end of its lifetime sometimes enables the checks to be performed more efficiently because checking correctness of many operations together may allow optimizations compared to the checking of every operation separately.

This is so in the case of store operations (reads and writes) and also in the case of inequalities of integers. This is the reason why comparison operations at the post stage implemented in the standard library require a supplementary data structure, a size asserter. The size asserter is a struct that collects information about numbers for which it must be checked that their binary representation uses at most a certain number of bits. Checking this for many integers together can be performed more efficiently than checking this for each number separately.

## Default declarations

Using a *default declaration*, a prorammer can specify a set of natural numbers from which the compiler must choose moduli if a fixed modulus cannot be inferred from the program. If there is no default declaration and the type of the main function contains type variables of kind `Nat` then a type error occurs as all moduli must be known for compiling and executing the program. Default declarations provide a backdoor to successful compilation even if the main function does not fix all moduli.

For instance, suppose that a program contains the following type and default declarations:

```
type N : Nat = 1030307;
type M : Nat = 0x1fffffffffffffff;
default(127,M,N);
```

The default declaration provides three moduli, one of which is expressed by a literal and others are expressed by type synonyms.

The compiler assigns one of the default moduli to each free type variable (all of which are of the kind Nat) of the main function in such a way that all type constraints of the main function meet the predicates of the CCC file that accompanies the compilation. If no such assignment is possible then the compilation fails with a type error.

A default declaration must be located in the same file as the main function and there may be at most one of them.
