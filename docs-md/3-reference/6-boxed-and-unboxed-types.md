# Boxed and unboxed types

## Primitive Types

Values of most types in ZK-SecreC are reference counted, making them cheap to clone by just increasing the reference count instead of making a deep copy of the data structure. However, for basic integers and booleans in the `$pre` domain, the overhead of reference counting is much larger than the cost of actually doing arithmetic or boolean operations on them, making those operations up to 2 orders of magnitude slower than they are in Rust. For this reason, integers of the types `uint[`2<sup>*n*</sup>`]` where *n*=8,16,32,64,128 are compiled to integers of Rust types `u8`, `u16`, `u32`, `u64` and `u128`, respectively. These types, as well as all boolean types, do not have reference counting. Arithmetic, boolean, and comparison operations on them have speeds close to those of the corresponding operations in Rust.

Primitive types can be domain polymorphic or have a fixed domain (e.g. `@prover`). The types must be known to be in the `$pre` stage at compile time. If they are stage polymorphic then they will be reference counted even if they are in the `$pre` stage during run time. Booleans can also be polymorphic in the modulus but integers must have the modulus known at compile time, otherwise they will be reference counted.

The following operations on primitive types have speed close to the corresponding operations in Rust:

* Arithmetic operations `+`, `-`, `*`, `/`, `%`
* Comparison operations `==`, `!=`, `<`, `<=`, `>`, `>=`
* Boolean operations `&`, `|`, `xor`, `!`

## Vectors and lists

In this section the term *array* is used to include both ZK-SecreC vectors (`arr[...]`) and lists (`list[...]`).

Arrays in ZK-SecreC can be internally boxed or unboxed, although there is no difference in the type of the array. Boxed arrays have each element separately reference counted, causing much more overhead when accessing the elements. The elements of boxed arrays can be of non-primitive or primitive type. Unboxed arrays do not have each element separately reference counted and the elements can only be of primitive type. All primitive types can be used as elements of unboxed arrays. Both boxed and unboxed arrays as a whole (as opposed to their individual elements) are always reference counted.

If an array is created and its element type is known to be primitive at compile time then the array will automatically be unboxed. If the element type is not known to be primitive at compile time (e.g., in polymorphic functions) then the array will be boxed, even if the element type will actually be primitive during run time.

Boxed and unboxed arrays can be used interchangeably in ZK-SecreC native code, i.e., an unboxed array can be given as an argument to a polymorphic function that expects a boxed array and a boxed array of primitive values returned from a polymorphic function can be used in a non-polymorphic code that expects an unboxed array. Whole arrays are not automatically converted from boxed to unboxed type or vice versa. Instead, individual elements of the array are converted between reference counted and primitive types as needed. This can cause some extra overhead. A for loop can be used to make a copy of an array with optimal boxedness for the current scope.

However, boxed arrays of primitive types cannot be passed to foreign functions.
