# Values and Types

This section provides an informal introduction to the basic concepts of ZK-SecreC programming language. The syntax is described in later sections. A more detailed introduction to the type and effect system of ZK-SecreC is provided later.

## Qualifiers

All values of ZK-SecreC are divided into clearly delimited data types. In this sense, ZK-SecreC is similar to a strongly typed programming language. Unlike usual programming languages, ZK-SecreC types involve *qualifiers* related to reliability and privacy of the data in the type. All data within the same type must have the same qualifiers, hence qualifiers are indeed attributes of type.

Each non-functional data type is equipped with two qualifiers called *stage* and *domain*. The first of them, the stage, determines if the values of the type belong to the circuit, or are local to a party or parties. A stage can be either *pre*, meaning the values being local, or *post*, meaning the values being on wires of the circuit. The second qualifier, the domain, determines which parties have access to the data. Possible domains are *prover*, *verifier* and *public*. Data in the prover domain are visible to the prover only. Data in the verifier domain are visible to both the prover and the verifier. Data in the public domain are known during the compile time.

ZK-SecreC defines a linear subtyping order on domains, the public domain being the lowest and the prover domain being the highest. It reflects the idea of increasing privacy. All data known to the verifier can be revealed to the prover but not vice versa. All data in the public domain, i.e. that are known to ZK-SecreC compiler, are available to both the verifier and the prover, while the verifier's and the prover's data are not available to the ZK-SecreC compiler. One purpose of the type system of ZK-SecreC is preventing leakage of private data, i.e, guaranteeing that data in higher domains will not become available in lower domains during computation.

Somewhat analogously, ZK-SecreC observes a subtyping order also on stages, defining the post stage as lower than the pre stage. This reflects the idea of decreasing reliability (i.e., larger in the order means less reliable). A reliable piece of data becoming available in the less reliable world makes no harm, but the converse is not true. Since circuit outcome decides the result of the ZK proof, data in the circuit used for computing must be reliable. A local computation is performed by parties and is not guaranteed to follow the ZK-SecreC program, hence its outcome is unreliable.

However in practice, we consider data in the pre stage of the public and the verifier domains also reliable, because we postulate that only the prover might be motivated to cheat.

Most of ZK proofs make use of expanded witnesses, i.e., additional data inputs given to the circuit by the prover. Hence moving data from the pre stage to the post stage must nevertheless be allowed, violating the subtyping order. ZK-SecreC provides no guarantees of maintaining reliability of the data in the circuit. It is up to the programmer to apply all checks necessary to ensure that the data in the circuit originally provided by the prover could not be fake.

When not clear from the context, types equipped with qualifiers are called *qualified types*, while types without qualifiers are called *unqualified types*.

## Primitive data

### Integers and field elements

An arithmetic circuit is assumed to compute on non-negative integers less than a fixed prime number. Overflows and underflows (i.e., negative numbers) are resolved modulo the prime number. This way, operations in the circuit and values on wires can be interpreted as operations of a finite field and field elements, respectively.

More precisely, the underlying computing model can actually include multiple arithmetic circuits, each using its own modulus. ZK-SecreC has a bounded integer type for each prime number to accommodate computations in such circuits. Strictly speaking, ZK-SecreC does not check primality of the module, but the standard library of ZK-SecreC is written with the assumption that all moduli of computations on wires are prime numbers.

All integer types with a prime modulus can be used with both the pre stage and the post stage, as well as with all three domains. At the pre stage, it is allowed to use computations with any (prime or composite) modulus. Loop indices and list lengths must be integers with modulus 2<sup>64</sup>. In addition, ZK-SecreC has an unbounded integer type that contains all non-negative, as well as negative integers. These integers can also be used at the pre stage only, in all three domains.

### Booleans

ZK-SecreC supports booleans. For maintaining ability to translate booleans to circuit values, a boolean type can be equipped with a modulus, too. All boolean types contain just two values, true and false.

Like integer types, booleans with prime modulus can be used at both the pre stage and the post stage, as well as in all three domains. Booleans with a composite modulus and booleans without a modulus can be used at the pre stage, in all three domains.

### Unit

There is a unit type consisting of just one value. ZK-SecreC uses the unit type as the formal return type of functions that return no meaningful value. The unit type is always qualified with the pre stage because the single unit value is not used by the circuit.

## Data structures

### Tuples

A *tuple* is a finite sequence of values of possibly different types. For every finite sequence of qualified types, there is an unqualified type of tuples of components having these types (in the corresponding order). The number of elements is thus reflected by the type. Tuple types are always qualified with the pre stage.

Tuple components can be accessed by name. The name of each component is the decimal representation of its index. Component indexing starts from zero.

### Structs

Like a tuple, a *struct* is a finite sequence of values of possibly different types and the number of struct components is fixed by the type. Unlike in the case of tuples, the struct type and the struct components have names chosen by the programmer. Struct components can be accessed by these component names. The component names are also determined by the type.

### Lists

A *list* is a finite sequence of values of one and the same qualified type. The element type being qualified implies that all elements of any list must have the same stage and domain, not just the same type of data. The length (i.e., the number of elements) is a non-negative integer that is not determined by the type and does not have to be known to the compiler. Lists can be accessed by index, this is the most standard method of accessing list elements. But one can also append new elements to the end of a given list.

There is an unqualified list type of every qualified element type. This way, a list type can be given qualifiers other than those of the element type. In particular, the domain of a list is the domain where the structure of the list is known, which may differ from the domain where the elements of the list are known. As any list has a linear shape, the only piece of information provided by the structure of the list is its length. All lists are at the pre stage since the circuit does not deal with the list structure.

### Vectors

A *vector* is also a finite sequence of values of one and the same qualified type. Similarly to lists, the length of a vector is not determined by the type. Like lists, vectors can be accessed by index.

Unlike lists, vectors are compiled into consecutive wire ranges in the circuit and are supposed to be processed in ways that take advantage of the special memory allocation. Also unlike the case of lists, one cannot append new elements to vectors.

Vector types are parametrized and qualified similarly to list types.

### Tensors

A *tensor* is a special form of a vector that can have 1 or more dimensions. It has the same type as a vector. The number of dimensions is not part of the type, it is determined at runtime. An ordinary vector is considered as a 1-dimensional tensor.

A tensor has a fixed length in each dimension. This is in contrast with lists of lists, where each element list can have a different length. The *shape* of an *n*-dimensional tensor is a list of *n* integers [*m*<sub>1</sub>,...,*m*<sub>n</sub>], where *m*<sub>i</sub> is the length in the *i*th dimension. The total number of elements in this tensor is *m*<sub>1</sub>⋅...⋅*m*<sub>n</sub>.

### Stores

ZK-SecreC also supports dictionaries called *stores*. Currently, only integers are accepted as keys and values. Both keys and values of stores must have the same stage and the same domain.

In the past versions of ZK-SecreC, all stores were builtin. Now, stores in the post stage are defined as structs in the standard library but their implementation still relies on builtin stores in the pre stage.

## Functions

ZK-SecreC supports functions like most programming languages. Functions in ZK-SecreC can have one or more arguments and must have exactly one return value. The types of the arguments and the type of the return value together form the type of the function. If a function with no arguments or no return value is wanted then the unit type can be used as placeholder.

Each argument type and the result type of a first-order non-curried function must be a qualified type. ZK-SecreC also supports higher-order functions, i.e., functions whose arguments are functions, and curried functions, i.e., functions whose result value is a function.
