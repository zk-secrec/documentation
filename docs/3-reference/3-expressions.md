# Expressions

## Primitive expressions

This subsection describes expressions that are primitive w.r.t. the Dijkstra shunting yard algorithm. This means that the structure within them does not affect parsing of parts of the expression outside of them. These parts may nevertheless have their own inner structure.

### Literals

Integer literals can stand for values of any type `uint[`*N*`]` and also values of type `uint`, regardless of the stage and domain. If the number expressed by the literal equals or exceeds the modulus then the value of the literal equals the reminder of this number upon division by the modulus. Similarly, Boolean literals can stand for values of any type `bool[`*N*`]` and also values of type `bool`, regardless of the stage and domain.

String literals can be in any of the three domains but the stage can be `$pre` only.

### Tuples, structs, stores

The tuple of expressions *e*<sub>1</sub>, ..., *e*<sub>*n*</sub>, in this order, is written as `(`*e*<sub>1</sub>`,`...`,` *e*<sub>*n*</sub>`)`. The value of the latter expression is the tuple of values of the component expressions, in the given order.

New structs can be created by the expression *S*`{`*x*<sub>1</sub>`:`*e*<sub>1</sub>`,`...`,`*x*<sub>1</sub>`:`*e*<sub>*n*</sub>`}`, where *S* is the name of the struct type, *x*<sub>1</sub>,...,*x*<sub>*n*</sub> are names of fields in structs of this type, and *e*<sub>1</sub>,...,*e*<sub>*n*</sub> are expressions. Every field that the struct type requires must occur in the expression. The value of this expression is the struct containing precisely all the named fields, the value of each field being the value of the subexpression corresponding to the name of the field. 

Since the time stores were first introduced into ZK-SecreC as a builtin feature, stores can be written using the delimiters `{#` ... `}`. Non-empty stores are written by providing some initial key-value pairs in the form `{#`*k*<sub>1</sub>`=>`*v*<sub>1</sub>`,`...`,`*k*<sub>n</sub>`=>`*v*<sub>n</sub>`}` whereas empty stores are written as `{#}`. Here, both *k*<sub>*i*</sub> and *v*<sub>i</sub> may be any expressions. Although stores in the post stage are no more builtin, the old builtin store syntax is still usable for creating them. Stores in the pre stage can be created similarly using the delimiters `{##` ... `}`.

### Lists

Lists with a known constant length can be created by expressions of the form `[`*e*<sub>1</sub>`,`...`,`*e*<sub>*n*</sub>`]`. The value of this expression is the list whose elements are the values of expressions *e*<sub>1</sub>,...,*e*<sub>*n*</sub> in this order. An empty list is written as `[]`.

To create a new list whose all elements are equal, one can write an expression `[`*e*`;`*n*`]` where *e* is an expression whose value is the repeating element and *n* is an expression whose value equals the number of repetitions.

### Parenthesized expressions

Expressions in the form `(`*e*`)` where *e* is any expression evaluate to the same value as *e*.

## Compound expressions

This subsection surveys expressions composed from smaller expressions using function and operator applications and other similar constructs.

### Operator application

Expressions can be composed using unary and binary operators. In the case of builtin operators, predefined precedences are used to determine the right syntax tree of expressions.

If another syntax tree is desired, subexpressions have to be parenthesized. For example, `1 + 2 * 3` is evaluated to 7 as multiplication binds tighter than addition, whereas `(1 + 2) * 3` evaluates to 9 because now addition in parentheses is done before multiplication.

If more than two subexpressions are connected by binary operators of the same precedence then the leftmost one takes precedence. Equality and comparisons are exceptions as applying them in sequence without specifying the order by parentheses is a syntax error.

Currently, precedences do not work with user-defined operators. Hence one must show the order of operations with parentheses, except when only builtin operators are involved.

### Function applications

Monomorphic function applications are written as expressions of the form *f*`(`*a*<sub>1</sub>`,`...`,`*a*<sub>*n*</sub>`)`, where *f* is the name of the function and *a*<sub>1</sub>, ..., *a*<sub>*n*</sub> are the argument expressions. In a larger expression, function applications bind tighter than any unary or binary operator.

Polymorphic functions usually can be called in the same way without specifying the actual type arguments, but if the actual type arguments cannot be inferred then they have to be specified before the ordinary argument sequence as a comma-separated list in brackets. The function identifier and the opening bracket must be separated by double colon. For instance, if the function `sum` assumes a stage and a domain as type level parameters like in the examples [Getting Started](../1-user-guide/1-getting-started.html) and this function is called with an actual (data level) parameter `xs` that fixes the stage and domain to be `$post` and `@verifier`, respectively, then the programmer can make the type level arguments explicit by writing the call as

`sum::[$post,@verifier](xs)`.

Function arguments can be passed by value or by reference; the particular way is fixed for every function and its argument. An argument that is passed by value is written as just an expression whose value is to be passed to the function. A pass-by-reference argument must be preceded by keyword `ref` and it must be a mutable variable or a (direct or indirect) lookup into a mutable data structure. The function may change the value of such arguments in general.

Pass-by-value parameters are immutable. Behind the scene, pass-by-value parameters may actually be passed by reference. Immutability guarantees that this does not change the semantics. So one may pass by value large data structures without the risk of wasting time and space for copying the data structure. The only difference between pass-by-value and pass-by-reference is the ability to mutate the parameter in the latter case.

Functions that do not have pass-by-reference parameters are allowed to be applied partially. This means that one can provide less arguments than the function is able to take. The value of such expression is a function that can take the remaining arguments. A function with at least one pass-by-reference parameter cannot be applied partially.

### Vectorized applications

ZK-SecreC allows the programmer to syntactically lift functions and operators to vectors. Vectorized application is identified by a period.

For example, applying function *f* to arguments *a*<sub>1</sub>, ..., *a*<sub>*n*</sub> in vectorized way is denoted by *f*`.(`*a*<sub>1</sub>`,`...`,`*a*<sub>*n*</sub>`)`, i.e., using `.(` as the delimiter opening the sequence of arguments. The value of this expression is well defined only if the values of all argument expressions are vectors of identical length. Evaluation of the vectorized application produces a new vector of the same length by applying function *f* pointwise.

To apply an operator in vectorized way, dot is written after the operator without space, e.g., the value of the expression *x*`*.`*y* is the pointwise product of the values of expressions *x* and *y* (provided that they are vectors of identical length).

In addition to 1-dimensional vectors, vectorized applications can also be used with higher-dimensional tensors. In this case, *a*<sub>1</sub>,...,*a*<sub>n</sub> must be tensors with the same shape and the result of the application also has this shape.

If the `iter` plugin of Circuit-IR is supported by CCC then the compiler translates vectorized applications via the `iter` plugin operations. If the `iter` plugin is not supported, vectorized applications are compiled via unrolling.

### Assertions

The `assert` builtin function is used to declare a new output node of the circuit. The assertion succeeds if the value of its argument is true. Similarly, `assert_zero` builtin function declares a new output node of the circuit. It succeeds if the value of its argument is zero. Both these functions must take its argument at the post stage.

Besides these assertion functions, ZK-SecreC provides assertion functions `dbg_assert` and `dbg_assert_eq` without circuit output for debugging. The former assert succeeds if the value of its argument is true. The latter one assumes two arguments of integer types with possibly different modules and succeeds if the integer values (i.e., remainders upon division by the corresponding modules) are equal. These functions assume that their arguments are in the pre stage. These functions do not contribute to the circuit, but the program halts with an error message whenever any of these assertions fail.

### Builtin operators and functions

The following builtin operators are available:

| Operators              | Arity | Precedence | Associativity | Meaning
|------------------------|-------|------------|---------------|------------------------------
| `!`                    |   1   | 90         |               | negation
| `*` `/` `%`            |   2   | 80         | left          | product, quotient, remainder
| `+` `-`                |   2   | 70         | left          | sum, difference
| `<=` `>=` `<` `>`      |   2   | 50         | none          | comparisons
| `==`                   |   2   | 40         | none          | equality
| `&`                    |   2   | 30         | left          | conjunction
| `^`                    |   2   | 20         | left          | xor
| `|`                    |   2   | 10         | left          | disjunction

The higher the precedence, the more tightly the operator binds its arguments.

The builtin functions are described in the [Builtins](../4-api/builtins.html) subsection of this documentation.

### Lookups and slices

Components of tuples, structs and stores, as well as elements of lists and vectors, can be accessed using the corresponding lookup syntax.

A tuple component can be accessed by index. The value of an expression of the form *e*`.`*i*, where *e* is an expression and *i* is an integer literal, is the *i*-th component of the tuple that *e* evaluates to. As the index must be a literal rather than an arbitrary expression, the compiler can decide if the index falls into the bounds required by the type of the tuple and give a static error otherwise. Indexing starts from zero.

A struct component can be accessed with a similar syntax but using a field name instead of an index. The value of an expression of the form *e*`.`*x*, where *e* is an expression and *x* is a field name, is the component associated to the name *x* in the struct that *e* evaluates to. Again, the compiler can decide if the access is correct as available field names are determined by the struct type.

Store elements can be accessed by expressions of the form *e*`{#`*k*`}`. Here, *e* and *k* are expressions whose values are the store and a key, respectively.

An element in a list or vector can be accessed using its index in square brackets, i.e., with an expression of the form *e*`[`*i*`]` where *e* and *i* are expressions. Provided that the value of *e* is a list or vector and the value of *i* is a non-negative integer falling into the bounds of the list or vector, the value of the lookup expression is the corresponding element of the data structure. The compiler does not make sure that the index indeed falls between the bounds. If not, the computation halts abnormally. This is considered equivalent to ZK proof failure.

ZK-SecreC allows using the square bracket syntax for extracting slices. To this end, one must specify a *range* of indices rather than a single index within brackets. The range is specified in terms of its lower bound and upper bound; the range contains all indices not less than the lower bound and less than the upper bound.

The bounds of the range can be specified by any expressions and these expressions are separated by the double dot token. For example, *e*`[`*a*`..`*b*`]`, where *e*, *a* and *b* are expressions, is a slice expression. Provided that the value of *e* is a list or vector and the values of both *a* and *b* are integers within the index bounds of the list or vector, the value of the slice expression is a new data structure of the same type as the original one (list or vector) and its elements are precisely the elements of the original data structure whose index falls into the range determined by the two integers (the first one being the lower bound).

ZK-SecreC allows one to omit either of the two bounds. In this case, the corresponding bound is that of the original data structure. If both bounds are omitted, the result is a copy of the original data structure.

A higher-dimensional tensor can also be sliced but only according to the first dimension as slicing by any other dimension would leave the elements on non-consecutive wires, which is not supported by Circuit-IR. Slicing an *n*-dimensional tensor uses the same syntax as vector slicing and returns another *n*-dimensional tensor.

### Assignments

*Assignment* is denoted by `=` in ZK-SecreC. For instance,

```
ix = ix + 1
```

increases the value of the variable `ix` by one. For a variable to be assigned to, it must be a mutable local variable or a pass-by-reference parameter of function.

If a variable can be assigned to, and its value is whatever data structure except a vector, then its components, components of components etc., can be assigned to one by one if necessary. Such assignment uses the same notation as lookup. For instance,

```
t.1 = 30
```

is syntactically correct, provided that `t` can be assigned to. For type correctness, the type of variable `t` must be a tuple type with at least 2 components, the second of which is an integer type. As the result, the value of `t` will be the same tuple as before with the second component redefined as 30. Struct components can be redefined likewise. If the value of `s` is a store then the component under some key `k` can be changed to 10 by

```
s{#k} = 10
```

Similarly, if the value of the variable `l` is a list and the value of the variable `i` is an integer marking an existing position in the list then, for instance,

```
l[i] = l[i-1]
```

redefines the value of the element in the list at position *i*, where *i* is the value of `i`, to be the same as the previous element. However, if `l` is a vector rather than a list then this assignment is illegal since vectors can be assigned as a whole only.

If the values of `v` and `w` are vectors and `v` can be assigned to then one can assign to it in vectorized way using

```
v =. w
```

### Type annotations

The compiler tries to infer the types for each value automatically. However, sometimes there is not enough information and it may be necessary to declare the types of some subexpressions manually. This can be done with *e*`:`*q* where *e* is an expression and *q* is its qualified type. It is also allowed to declare the type partially, for example *e*`:uint` or *e*`: uint @prover`. A type annotation, if given, must always contain the data type, both qualifiers (stage and domain) are optional.

### Casts

Providing a type annotation to an expression does not change the type of the expression. If the compiler discovers that the expression is actually not of the annotated type then a type error occurs.

A cast expression can be used to change the type of an expression. In a cast expression, the `as` keyword is used to separate the expression and the type. For instance, if the value of *e* is an expression of whatever integer type then *e* `as uint[3]` is a cast expression whose value is the same value in the finite field of size 3. If the value of *e* is larger than 3 then remainder of it upon division by 3 is found.

All integer types can be cast to each other; so can all boolean types. It is also possible to cast a boolean to an integer of the same modulus. However, casting integers to booleans is not allowed as a builtin operation since it would require deciding if an integer is zero or not and being able to continue computing (rather than halting on non-zero value like `assert_zero`). This would involve non-trivial algorithms in the circuit computation model of ZK that we assume.

Casts can be done on domains and stages as well. Such cast must respect the corresponding subtyping order. Hence it is always possible to cast from the public domain to the verifier and prover domains and from the verifier domain to the prover domain but not the other way round. A value at the post stage can be cast to the pre stage but not vice versa.

If a domain cast is applied to a list or vector then a *deep cast* is performed. This term means that the cast is applied to all constituents of the list or vector that are in a domain lower than the new domain of the list or vector. For instance, suppose that *x* is of type `list[list[uint $pre @prover] $pre @verifier] $pre @public`, i.e., the value of *x* is a list of lists of integers in the prover's domain, whereby the intermediate list structures are in the verifier's domain and the outermost list structure is public. Then the type of the expression `x as @prover` will be `list[list[uint $pre @prover] $pre @prover] $pre @prover` which means that the intermediate list structures are also raised to the prover's domain. On the other hand, the type of the expression `x as @verifier` will be `list[list[uint $pre @prover] $pre @verifier] $pre @verifier` since the integers inside the innermost lists are in a higher domain already.

It is not possible to change both qualifiers or the data type and a qualifier within one cast. For instance, *x* `as $pre @prover` is incorrect; instead, one must perform two casts by writing *x* as `$pre` `as` `@prover`.

## Statements and expressions with blocks

To explain the remaining constructs for building expressions, the notions of statements and blocks must be introduced.

### Statements

*Statements* form a syntactic category distinct from expressions but still close to expressions as most statements contain expressions and are themselves necessary for building larger expressions. Informally, statements could be described as syntactic constructs that have a side effect rather than a meaningful return value. All statements end in a semicolon.

In particular, any expression of the unit type can be used as a statement. Other statements include the `break` and `continue` statements and new variable definitions.

The `break` and `continue` statements can be used in the body of a loop and have roughly the same meaning as in C. That is, `continue` starts a new iteration of the loop body and break jumps out of the loop.

New variable definitions are written in one of the following forms:

`let` *x*`:`*t*`=`*e*`;`

`let mut` *x*`:`*t*`=`*e*`;`

`let rec` *x*`:`*t*`=`*e*`;`

Here *x* is the new variable, *t* is a type expression that denotes the type of *x* and *e* is an expression. The variable *x* is initialized to the value of the expression *e*. The modifier `mut` makes *x* mutable. Mutability in ZK-SecreC is a property of variable and propagates to all components of the value of the variable if the value is a data structure. The modifier `rec` allows the definition to be recursive, i.e., *x* to occur in *e*. This can be used only for defining a list by expressing its elements in terms of previous elements. A variable definition without modifiers does not allow recursive definition nor mutating the value of the new variable later.

The type expression along with the preceding colon can be omitted if ZK-SecreC is able to infer the type of *e*. Often it is not the case. For instance, the return type of a vectorized application must usually be explicitly given like in

```
let t3 = ...;
let trash : arr[() $pre @public] = assert_zero.(t3);
...
```

### Blocks

A *block* is a sequence of statements, possibly followed by an expression, in braces. If the content of a block ends with an expression then the value of the block equals the value of the expression. If the block does not end with an expression then the block returns the single value of the unit type. One can make this difference according to whether the last item in the block ends with a semicolon or not. All statements and the final expression, if any, are executed in order before the final value is returned.

The sequence of statements in a block may be empty. An totally empty block `{}` is also allowed. The latter is the easiest way to denote the single value of the unit type.

### Lambda expressions

Lambda expressions enable one to introduce new functions locally rather than at the top level.

The simplest form of a *lambda expression* is `fn (`*x*<sub>1</sub>`,`...`,`*x*<sub>*n*</sub>`)` *b* where *x*<sub>1</sub>,...,*x*<sub>*n*</sub> are variables standing for formal parameters and *b* is a block that constitutes the body of the new function. The scope of the formal parameters extends over the block *b*. The lambda expression denotes the function that evaluates its body after assigning the values of actual parameters to the corresponding formal parameters.

Arguments of functions defined by lambda expressions are passed by value (immutable). The formal parameters of a lambda expression can be annotated with their types but this is not mandatory. Likewise, one can annotate the return type just after the parameter sequence in the form `->` *t*. Omitting the return type does not restrict the return type in any way. For instance, `fn (x) { x*x+1 }` denotes the function that returns the number one larger than the square of the argument. The same function can be written also as `fn (x : uint) -> uint { x*x+1 }`. This restricts the unqualified type to be `uint` while leaves the stage and domain unspecified. Note that a lambda expression cannot be polymorphic, implying that a function defined by a lambda expression cannot have different types of arguments in different applications.

A function defined by lambda expression can be declared a *sieve function* by adding the keyword `sieve` at the beginning of the expression. This forces the function to be compiled to a function gate in Circuit-IR and applications of the function to be compiled to calls of that function gate. Applications of functions not declared as sieve functions are inlined. Declaring a user-defined function as a sieve function is required if the function has vectorized applications.

### Conditional expressions

A standard *conditional expression* is of the form `if` (*e*) *b*<sub>1</sub> `else` *b*<sub>2</sub> where *e* is an expression whereas *b*<sub>1</sub> and *b*<sub>2</sub> are blocks. When evaluating this expression, the expression *e* is evaluated first. Depending on the value of *e*, either *b*<sub>1</sub> or *b*<sub>2</sub> is evaluated and the value of that block becomes the value of the conditional expression.

One can also use a type constraint *c* instead of condition *e*. Then *b*<sub>1</sub> or *b*<sub>2</sub> is evaluated, depending on if the type constraint holds or not.

For instance, it is possible to use the following syntax in a control flow to change the function behaviour based on the actual value of a domain parameter `@D`:

```
if (@D <= @verifier) {
  ...  // Operations if the domain is `@public` or `@verifier`
} else {
  ...  // Operations if the domain is `@prover`
}
```

Similarly, it is possible to do different things depending on the actual value of a stage parameter:

```
if (post $S) {
  ...  // Operations if the stage is $post
} else {
  ...  // Operations if the stage is $pre
}
```

The else branch can be omitted. In this case, an else branch `else {}` is internally added by the compiler. The program is not type correct if the conditional expression fails to type after this addition.

### For loops

For loops are written as `for` *x* `in` *e*<sub>1</sub>`..`*e*<sub>2</sub> *b*, where *x* is a fresh variable, *e*<sub>1</sub> and *e*<sub>2</sub> are expressions and *b* is a block. The expressions must evaluate to integer bounds. The scope of the variable *x* embraces the block *b* but not the expressions *e*<sub>1</sub> and *e*<sub>2</sub>. The block *b* is executed for all values of the variable *x* within the range determined by the bounds, in the increasing order of these values. The lower bound is included in the range while the upper bound is excluded from it. Hence the number of iterations equals the difference of the upper and lower bounds. The value of the for loop is the list of all values returned by the body of the loop during all iterations, in the order of evaluation.

If the value of *e*<sub>2</sub> is smaller than the value of *e*<sub>1</sub> then the body of the loop is executed no times. Note that the bounds are interpreted as 64-bit unsigned integers. Therefore, if *e*<sub>2</sub> is, e.g., `-1` then the loop runs until the loop index becomes 2<sup>64</sup>-1.

When defining a list with a for loop, the body of the loop is allowed to refer to the elements with a smaller index in the list. Referring to the same list is possible only if the for loop is the right-hand side of a definition of a new variable and the definition starts with `let rec`. For instance, the following piece of code is a legal content of a block and computes the sum of integers 1, 2, 3:

```
let xs : list[uint $pre @public] = [1, 2, 3];
let rec sums_xs : list[uint $pre @public] = for i in 0..length(xs) {
  if (i == 0) {
    xs[i]
  } else {
    sums_xs[i-1] + xs[i]
  }
};
sums_xs[length(xs) - 1]
```

### Zip expressions

There is also a construct in ZK-SecreC that enables one to build new vectors from existing ones by doing the same operations on the corresponding elements. The construct is of the form `zip` *x*<sub>1</sub> `in` *e*<sub>1</sub>`,` ... `,` *x*<sub>*n*</sub> `in` *e*<sub>*n*</sub> `with` *b* where *x*<sub>1</sub>,...,*x*<sub>*n*</sub> are fresh variables, *e*<sub>1</sub>,...,*e*<sub>*n*</sub> are expressions and *b* is a block. The expressions must evaluate to vectors. For each evaluation of the body, the variables are assigned corresponding elements of the vectors and the value of the body *b* will be the corresponding element of the result vector.

Note that the scope of all local variables *x*<sub>1</sub>,...,*x*<sub>*n*</sub> equals the block *b* regardless of their position before the keyword `with`, i.e., variables introduced by the zip expression cannot be used in any of expressions *e*<sub>1</sub>,...,*e*<sub>*n*</sub> (even in those that follow the location where the variable is bound). This restriction is necessary for allowing the result to be computed by vectorized function application.

Technically, this construct creates a local sieve function with the iterator variables as parameters and the body of the zip construct as the body, and applies it in vectorized way to the given vectors. Hence all the vectors in the zip construct must have the same length and the result is again a vector of the same length. For instance,

```
let zs = zip x in xs, y in ys with { x * y + 1 };
```

is equivalent to

```
let f = sieve fn (x, y) { x * y + 1 };
let zs = f.(xs, ys);
```

### Wire expression

With a type cast, one can convert a value at the post stage to the pre stage but not vice versa. To specify circuit inputs, values at the pre stage must be converted to the post stage. This is done using *wire expressions* of the form `wire` *b* where *b* is a block whose value is to be converted. Wire expressions can be used to cast an integer or a boolean value from the pre stage to the post stage. In either case, the modulus must be finite.

As a wire expression brings values from the unreliable world to the circuit which should be kept reliable, it is potentially a dangerous operation, especially if the value belongs to the prover's domain. Bringing a value in the prover's domain from the pre stage to the post stage means that the prover is asked to input the value to the circuit, but a malicious prover can provide incorrect values. Hence, whenever a value in the prover's domain is put on a wire using a wire expression, the programmer should provide subsequent correctness checks of the value.

In particular, when bringing public or the verifier's values to the stage `$post` and casting them to the domain `@prover`, it is important to pay attention to the order in which the conversions are performed. In the following example, we cannot be sure whether the resulting value is taken from the iterator or chosen arbitrarily by the prover:

```
for i in 0..100 {
  let j = wire { i as uint[N] as @prover };
  /* j is used in some place which expects a value in domain @prover */
}
```

Here the value of `i` was cast to the domain `@prover` *before* it was brought into `$post`. This means that the prover has total control over the value stored in the circuit. The correct way is to first bring the value of `i` to the stage `$post` and then cast to the domain `@prover`:

```
for i in 0..100 {
  let j = (wire { i as uint[N] }) as @prover;
  /* same as before */
}
```

(In both cases, we assume that `N` has been defined as a supported field size.)

### Match expressions

ZK-SecreC supports match expressions that serve the purpose of performing oblivious choices depending on values on wires. Match expressions are of the form `match` *e* { *p*<sub>1</sub> `=>` *b*<sub>1</sub>, ......, *p*<sub>*n*</sub> `=>` *b*<sub>*n*</sub> }, where *e* is an expression, *p*<sub>1</sub>,...,*p*<sub>*n*</sub> are patterns and *b*<sub>1</sub>,...,*b*<sub>*n*</sub> are blocks. A *pattern* is an integer literal or a variable or an underscore.

The expression *e* is evaluated first and the result should be a value on wire. After that, the first block *b*<sub>*i*</sub> such that the value of *e* matches the corresponding pattern *p*<sub>*i*</sub> is evaluated. A value matches a literal pattern if it equals the value of the literal; a variable and an underscore are matched by any value. If a pattern is a variable then that variable can be used in the corresponding block and its value equals the value of *e*. Unlike variables, the underscore cannot be used in the right-hand side for referring to the value.

In a standard arithmetic circuit, an oblivious choice that evaluates only the right branch is impossible. A choice function implemented in a standard arithmetic circuit would evaluate all branches and combine the results obliviously. Compiling of match expressions according to the intended semantics relies on the `disjunction` plugin of Circuit-IR that implements a corresponding extension of arithmetic circuit.
