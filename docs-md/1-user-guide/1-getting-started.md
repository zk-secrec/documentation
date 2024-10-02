# Getting Started

## A trivial factorization example

In this example, we will write a simple ZK-SecreC program that will read two
integers from the witness file and prove that these two numbers are factors of
a publicly known integer.

First let's create a new ZK-SecreC program:

```
// factors.zksc
// The prover wants to convince the verifier of knowing a factorization of 96

type N : Nat = 0xfffffffb;

fn main() where Field[N] {
  let n : uint[N] $pre @public = 96;
  let x : uint[N] $post @prover = wire { get_witness("x") };
  let y : uint[N] $post @prover = wire { get_witness("y") };
  let z : uint[N] $post @prover = (wire { n }) as @prover;
  assert_zero(x * y - z);
}
```

The first two lines, starting with `//`, are comments. The following code line defines `N` to be a type-level natural number. Its value 2<sup>32</sup>-5 is given in hexadecimal notation. The program contains one function `main` which is the starting point of the execution.

The first line of the body of the `main` function defines a variable `n` to hold the public integer 96. The stage qualifier `$pre` in the type of the variable shows that this value will lie outside the circuit. The next two lines load the values of variables `x` and `y` from the witness file using `get_witness`. We enclose the result of the `get_witness` function in a `wire` block, telling that these values should be given to our circuit as inputs. So the stage qualifier of these variables is `$post`. The fourth line of the body of the function similarly forwards the public integer 96 to the circuit. The `as @prover` part of the line lifts the number to the prover's domain. This is necessary for the subtraction in the next line to be type correct. Finally, the last line of the body of the `main` function makes the assertion that the product of the first two inputs equals the last input. Assertions in ZK-SecreC will become the outputs of the circuit.

The data type `uint[N]` occurring in the code is the type of elements of the finite field of size previously assigned to the variable `N`. The head line of the function (after the keyword `where`) declares `N` to satisfy the type constraint `Field`. This is necessary for putting values of type `uint[N]` on wires. For semantic correctness, the value of `N` must be a prime number. It is the responsibility of the programmer to ensure this property as ZK-SecreC compiler does not check for primality. 

Note that, although the syntax and type rules of ZK-SecreC allow the order of conversions in the fourth line of the body of the function to be reversed (to obtain `wire { n as @prover }`), it is crucial for credibility of the ZK proof to have the order of conversions as shown in the code. Namely, `(wire { n }) as @prover` first passes the number 96 to the circuit and only then lifts it to the prover's domain. Doing things in the opposite order would mean that the circuit will get the input after the value has been lifted to the prover's domain, which enables the prover to replace the value with whatever other value before passing it to the circuit. Hence the prover could choose the factors arbitrarily and feed the circuit with the product of these factors instead of 96. The proof would succeed incorrectly.

Before we can compile this example code, we also need a `.json` file containing the secret integers.  Suppose `witness.json` has the following contents:

```
{
  "x": "16",
  "y": "6"
}
```

Note the double quotes around both keys and values! The program will use the arguments of the `get_witness` function as keys of the dictionary in the `.json` file and reads the corresponding values. So the value of the variable `x` will be 16 and the value of the variable `y` will be 6.

To compile the program we have to run

```
runrust factors.zksc -w witness.json -o result
```

This creates files `result.rel`, `result_0.wit` and `result_0.ins`. The `.rel` file contains a list of wires which make up the arithmetic circuit:

```
// File result.rel
version 2.1.0;
circuit;
@type field 4294967291;
@begin
  $0 <- @private(0);
  $1 <- @private(0);
  $2 <- @mul(0: $0, $1);
  $3 <- @addc(0: $2, <4294967195>);
  @assert_zero(0: $3);
@end
```

The header (before `@begin`) contains the used version of Circuit-IR, the keyword `circuit` confirming the type of the file, and a field declaration. This is the size of the only finite field used in the ZK-SecreC program, now written in decimal. Now let's look at the wires (between `@begin` and `@end`).

```
  $0 <- @private(0);
  $1 <- @private(0);
```

These lines tell us that the values of wires `$0` and `$1` are inputs read from the witness stream, i.e., they are not public. There is one witness stream for every field. The argument of `@private` indicates the index of the field in the order of declaration in the header. In this example, only one field is used and its index is 0.

```
  $2 <- @mul(0: $0, $1);
```

This line declares that the values on wires `$0` and `$1` are multiplied in the field number 0 and the result is stored on wire `$2`. 

```
  $3 <- @addc(0: $2, <4294967195>);
```

Here, the value of the expression that is going to be asserted zero is stored on the wire `$3`. The constant written in angle brackets equals -96 in the finite field in which the computation is performed. So the value on wire `$3` will be the difference of the value on wire `$2` and the number 96.

```
  @assert_zero(0: $3);
```

Finally, the value on wire `$3` is asserted to be zero of the field number 0.

When we look into the `result_0.wit` file, we see that it contains the secret values `16` and `6`:

```
// File result_0.wit
version 2.1.0;
private_input;
@type field 4294967291;
@begin
  <16>;
  <6>;
@end
```

The file `result_0.ins` has an empty body because the verifier's input stream is not used in this example:

```
// File result_0.ins
version 2.1.0;
public_input;
@type field 4294967291;
@begin
@end
```

When running the zero-knowledge protocol, the prover would have access to the circuit and both input streams, but the verifier would only have the contents of the `.rel` file and the `.ins` file.

## A simple summation example

In the second example, we will write a ZK-SecreC program that will read a list of integers from the instance file and claim that their sum equals the number read from the witness file.

The ZK-SecreC program looks like this:

```
// summation.zksc
// The prover wants to convince the verifier of knowing the total sum of numbers in the verifier's list

type N : Nat = 1030307;
type M : Nat = 0x10000000000000000;

fn main() where Field[N] {
  let n : uint[M] $pre @public = get_public("n");
  let xs_pre : list[uint[N] $pre @verifier] $pre @verifier = get_instance("xs");
  let xs = for i in 0 .. n { wire { xs_pre[i as @verifier] } };
  let y = wire { get_witness("y") };
  let s = sum(xs);
  assert_zero(s as @prover - y);
}
```

The first line of the body of the function `main` reads a public constant from a `.json` file. The possibility to put public constants into a `.json` file is good for keeping data and program logic separate. Note the parameter `M` with value 2<sup>64</sup> in the data type. ZK-SecreC requires that all loop indices and list lengths are of the integer type with this module. Besides finite fields of prime size, ZK-SecreC supports 8-, 16-, 32-, 64-, and 128-bit integer types, which are written in the form `uint[`*M*`]` where *M* denotes the corresponding modulus 2<sup>8</sup>, 2<sup>16</sup>, 2<sup>32</sup>, 2<sup>64</sup> or 2<sup>128</sup>, and a type `uint` (without modulus parameter) of integers with unlimited size.

The second line of the body of the function `main` reads the verifier's file. It is assumed that the value of the key "xs" is a list of integers. This is reflected in the type annotation. The element type of the list is written in brackets after the `list` keyword. So the type `list[uint[N] $pre @verifier] $pre @verifier` establishes that the elements of the list are elements of the finite field of size 1030307 in the verifier's domain outside the circuit, and the list itself is also in the verifier's domain outside the circuit. 

The third line of the body of the function `main` passes the elements of the list one by one to the circuit as inputs and forms a new list of the values in circuit. The right-hand side of the definition in this line consists of a for loop which constructs the new list. It uses the previously read value of the variable `n` as the known length of the list. So we assume that, although the list and its elements are in the verifier domain, the length of the list is actually a public value. The length of the list would become public anyway since it will be reflected in the size of the circuit. The fact that `n` is public forces the loop index `i` that runs from 0 up to `n` to be public, too. In the body of the loop, however, the value of `i` must be lifted to the verifier's domain because, in order to lookup elements of a list, the index and the list must be in the same domain. For the same reason, the resulting list will be in the public domain since it is indexed by `i` which is public. Hence the type of `xs` is `list[uint[N] $post @verifier] $pre @public` but the type is omitted from the code. ZK-SecreC has built-in type inference which enables omitting types of variables if they can be inferred from context.

The fourth line of the body of the function `main` reads a value from the prover's file and passes it to the circuit. The next line finds the total sum of the verifier's values in the circuit, using a standalone function `sum`. The last line of the body of `main` asserts that the sum equals the prover's input.

The contents of the `.json` files could be as follows:

`public.json`:

```
{
  "n": "7"
}
```

`instance.json`:

```
{
  "xs": ["11", "22", "33", "44", "55", "66", "77"]
}
```

`witness.json`:

```
{
  "y": "308"
}
```

Let's now study several ways of defining the auxiliary function `sum`.

### Using a mutable variable

One can introduce a mutable variable that stores the intermediate sums and return its final value:

```
fn sum[$S, @D](xs : list[uint[N] $S @D]) -> uint[N] $S @D {
  let mut s = 0;
  for i in 0 .. length(xs) { s = s + xs[i] };
  s
}
```

The function returns the sum of its argument list that is denoted by the parameter `xs`. The first line of the body of the function introduces a new mutable variable `s`. Mutability is established by the keyword `mut`. In the loop that follows, each element of the argument list is added to the new variable. The final value of this variable will be the total sum. The last line returns it.

As it is, the defined function is polymorphic in both stage and domain. The type parameters `$S` and `@D` are written in brackets right after the function name. The characters `$` and `@` in front of the names indicate that the variables denote a stage and a domain, respectively. The declared type of the parameter `xs` is `list[uint[N] $S @D]` meaning that the function can work with lists of elements in the finite field of size 1030307 belonging to whatever domain, regardless of being outside or inside the circuit. One can make `N` also a type parameter of the function by adding `N : Nat` into the brackets. Currently, `N` refers to the global constant 1030307.

### Recursive definition of an auxiliary list

One can recursively define a list of partial sums and return its last element:

```
fn sum[$S, @D](xs : list[uint[N] $S @D]) -> uint[N] $S @D {
  let rec sums = for i in 0 .. length(xs) + 1 {
    if (i == 0) { 0 } else { sums[i - 1] + xs[i - 1] }
  };
  sums[length(xs)]
}
```

The signature of the function is the same as in the previous case. Instead of using an auxiliary mutable variable, the body of the function defines a variable `sums` to hold a list of all partial sums of elements of the original list. The first element is defined to be zero and each of the following elements is defined as the sum of the current element of the new list and the next element of the original list. Recursion in the local definition is allowed by the keyword `rec`. The last line of the body of the function returns the last element of the new list which contains precisely the total sum of elements of the original list.

### Calling the library function

The standard library of ZK-SecreC contains a function `sum` that finds the total sum of its argument list. Hence it suffices to import the corresponding module `Std`. For that, the following code line has  to be added to the file `summation.zksc`:

```
use Std::*;
```

This library module also defines the type synonym `u64` to denote the type `uint[0x10000000000000000]`. Hence, when using `Std`, there is no need to define `M` in the program, and the type `uint[M]` can be replaced with `u64`.

### Output

To compile the program we might run

```
runrust summation.zksc -p public.json -i instance.json -w witness.json -o result
```

All three variants lead to output files (relation description, verifier's input stream, and prover's input stream) with the following contents:

```
// File result.rel
version 2.1.0;
circuit;
@type field 1030307;
@begin
  $0 <- @public(0);
  $1 <- @public(0);
  $2 <- @public(0);
  $3 <- @public(0);
  $4 <- @public(0);
  $5 <- @public(0);
  $6 <- @public(0);
  $7 <- @private(0);
  $8 <- @addc(0: $0, <0>);
  $9 <- @add(0: $8, $1);
  $10 <- @add(0: $9, $2);
  $11 <- @add(0: $10, $3);
  $12 <- @add(0: $11, $4);
  $13 <- @add(0: $12, $5);
  $14 <- @add(0: $13, $6);
  $15 <- @mulc(0: $7, <1030306>);
  $16 <- @add(0: $14, $15);
  @assert_zero(0: $16);
@end
```

```
// File result_0.ins
version 2.1.0;
public_input;
@type field 1030307;
@begin
  <11>;
  <22>;
  <33>;
  <44>;
  <55>;
  <66>;
  <77>;
@end
```

```
// File result_0.wit
version 2.1.0;
private_input;
@type field 1030307;
@begin
  <308>;
@end
```

## A more serious example of factorization

In the initial factorization example, the prover might have submitted 1 and 96 as factors of 96 and the proof would still have been successful. Let's study how to update the program in such a way that only non-trivial factorizations would be accepted. This requires checking that neither of the factors is one. Moreover, the initial example allowed the prover to misuse overflow, i.e., cheat by providing two numbers whose product were equal to the verifier's number in the finite field but not in integers. In order to eliminate this possibility, size checks must be added. It is safe to assert that both factor candidates can be represented using less than half of the number of bits in the binary representation of the field size. This excludes overflow when the numbers are multiplied.

The following program would work:

```
use Std::*;
use Integer::*;
use Inequalities::*;

type N : Nat = 3647104749702663936044671300410017453855276508776292262406172562348790436137984035021;

fn main() where Field[N] {
  let z : uint[N] $post @verifier = wire { get_instance("z") };
  let x : uint[N] $post @prover = wire { get_witness("x") };
  let y = wire { z as @prover as $pre / x as $pre };
  assert(!eq(x, 1));
  assert(!eq(y, 1));
  let mut s = sizeasserter_new(((log2(N) - 1) / 2) as u64);
  let trash = check_size(x, ref s);
  let trash = check_size(y, ref s);
  assert_zero(x * y - z as @prover)
}
```

The first line of the body of `main` reads the number to be factorized and passes it to the circuit. The second line similarly reads one factor and passes it to the circuit.

In the third line, the second input from the prover goes to the circuit. Instead of reading it from the prover's file, the code instructs the prover to compute this input as the ratio of the verifier's input and the prover's first input. This computation must be delegated outside the circuit as the circuit does not support division. Therefore the stage of the operands must be transformed by `as $pre`. Computing the second factor instead of reading it from the file is a non-essential change that makes the second factor formally an expanded witness, but it does not cause changes in the resulting prover's stream as the latter does not distinguish between witness and expanded witness.

The fourth and fifth line assert that the factor candidates differ from 1. The built-in ZK-SecreC function `assert` requires a boolean argument and asserts it being true. The `eq` library function returns true if its two arguments are equal and false otherwise; the unary operator `!` negates its boolean argument. This somewhat complicated sequence of operations is necessary since there is no `assert_nonzero` function.

The next three lines deal with checking the size of the factor candidates. For that, a size asserter is created. A *size asserter* is an object that is able to check that binary representations of numbers fit into a fixed number of bits. The number of bits is given as argument when creating the object. Here, the argument is `(log2(N) - 1) / 2` where `log2` is the library function that returns the floor of binary logarithm of its argument; note that ZK-SecreC allows the programmer to use type level integers as values of type `uint`. The result must be cast to type `u64` as this is the argument type of the function `sizeasserter_new`. The actual check is triggered by the library function `check_size` that takes as arguments the number whose size is checked and a size asserter. The `let trash =` ` ` is there because the result of `check_size` is not used (similarly to assertions, if the size check fails then the whole ZK proof fails).

Note that the size asserter is assigned to a mutable variable, and it is also passed to the function `check_size` as mutable as indicated by the keyword `ref`. It is essential to make size asserters mutable since, for computational efficiency, they collect information about the checked numbers throughout the program, thus changing their value at every operation, and do all necessary checks together at the end of their life time.

Finally, the last line of the body of `main` asserts that the product of the claimed factors is indeed equal to the number being factorized.

The resulting files will be much larger than in the case of the first example. Therefore we will not present the contents of the resulting files. The body of the `.rel` file contains 1580 lines and the body of the `.wit` file contains 284 lines. The large size of witness is caused by library functions that expand the witness. Most of the size explosion is caused by operations with the size asserter (finding out binary representations requires input from the prover) but `eq` also has to expand witness since equality check along with returning of the result cannot be performed by the circuit alone. 
