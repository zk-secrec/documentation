# SIEVEIR Trait Methods

Here we will describe the methods of the SIEVEIR trait, which can be implemented when interfacing a new backend with the ZK-SecreC compiler. Some of the methods are required for all backends, some are optional.

## Arithmetic and boolean operations

All of these methods are required. The parameter `m` is the modulus of the wires, represented with the type `NatType`. Constants are of the type `Integer`, which is a type synonym for `BigInt` from `num_bigint`.

### Method and

`fn and(&self, m: &NatType, w1: &Wire, w2: &Wire) -> Wire;`

Logical conjunction.

### Method xor

`fn xor(&self, m: &NatType, w1: &Wire, w2: &Wire) -> Wire;`

Logical exclusive or.

### Method not

`fn not(&self, m: &NatType, w1: &Wire) -> Wire;`

Logical negation.

### Method mul

`fn mul(&self, m: &NatType, w1: &Wire, w2: &Wire) -> Wire;`

Modular multiplication.

### Method add

`fn add(&self, m: &NatType, w1: &Wire, w2: &Wire) -> Wire;`

Modular addition.

### Method mulc

`fn mulc(&self, m: &NatType, w1: &Wire, c2: &Integer) -> Wire;`

Modular multiplication between value on wire and constant value.

### Method addc

`fn addc(&self, m: &NatType, w1: &Wire, c2: &Integer) -> Wire;`

Modular addition between value on wire and constant value.

## Using instance and witness streams

These are not strictly required but strongly recommended as otherwise instances and witnesses cannot be used.
The methods `get_instance_wr` and `get_witness_wr` are not required if the backend does not support wire ranges.

The type `Value` represents any ZK-SecreC value but here it is assumed to be a scalar `$pre` value.

### Method add\_instance

`fn add_instance(&self, m: &NatType, x: &Value);`

Add a new value `x` to the instance stream of modulus `m`.

### Method get\_instance

Add a new value `x` to the instance stream of modulus `m`.

`fn get_instance(&self, m: &NatType) -> Wire;`

Get value of a new wire from the instance stream of modulus `m`.
This function is called sequentially so n-th call loads the n-th value from the instance.
The value must be added to the instance using `add_instance` before it can be read
with `get_instance` or `get_instance_wr`.

### Method get\_instance\_wr

`fn get_instance_wr(&self, m: &NatType, n: usize) -> WireRange;`

Get `n` values from instance to a new wire range.
This is equivalent to calling `get_instance` `n` times
but may be more efficient if the backend supports vectorized `get_instance`.
The `n` values must be added to the instance stream using `add_instance`
before they can be read with `get_instance_wr`.

### Method add\_witness

`fn add_witness(&self, m: &NatType, x: &Value);`

Add a new value `x` to the witness stream of modulus `m`.

### Method get\_witness

`fn get_witness(&self, m: &NatType) -> Wire;`

Get value of a new wire from the witness stream of modulus `m`.
This function is called sequentially so n-th call loads the n-th value from the witness.
The value must be added to the witness using `add_witness` before it can be read
with `get_witness` or `get_witness_wr`.

### Method get\_witness\_wr

`fn get_witness_wr(&self, m: &NatType, n: usize) -> WireRange;`

Get `n` values from witness to a new wire range.
This is equivalent to calling `get_witness` `n` times
but may be more efficient if the backend supports vectorized `get_witness`.
The `n` values must be added to the witness stream using `add_witness`
before they can be read with `get_witness_wr`.

## Assertions and field switches

Of these, only `assert_zero` and `assert_eq_scalar_vec` are required.

### Method assert\_zero

`fn assert_zero(&self, m: &NatType, w: &Wire);`

Assert that the value on the wire is zero.

### Method assert\_eq

`fn assert_eq(&self, m1: &NatType, w1: &Wire, m2: &NatType, w2: &Wire);`

Assert that values on two wires (of different moduli) are equal.

### Method assert\_eq\_scalar\_vec

`fn assert_eq_scalar_vec(&self, m1: &NatType, w1: &Wire, m2: &NatType, wires: Vec<Wire>);`

Assert that the value of `w1` has binary representation based on values of `wires`.
```
value(w1) = value(wires[0]) + 2*value(wires[1]) + 4*value(wires[2]) + ...
```
Used for more efficiently implemementing boolean circuit evaluation.

### Method bool2int

`fn bool2int(&self, m: &NatType, w1: &Wire, output_modulus: &NatType) -> Wire;`

Convert a boolean wire of modulus `m` to an integer wire of modulus `output_modulus`.

### Method int\_field\_switch

`fn int_field_switch(&self, m: &NatType, w1: &Wire, output_modulus: &NatType) -> Wire;`

Switch the field of `w1` to new modulus `m`.
For conversion of boolean to uint we use `bool2int` calls instead.

## Constants, cloning, copying, and dropping wires

Of these methods, `const_bool`, `zero_wire`, `clone_wire`, and `drop_wire` are required.

### Method const\_bool

`fn const_bool(&self, m: &NatType, b: bool) -> Wire;`

Load a constant boolean onto a fresh wire.

### Method const\_uint

`fn const_uint(&self, m: &NatType, x: &Value) -> Wire;`

Load a constant integer onto a fresh wire.
Similar to `add_instance + get_instance` and `add_witness + get_witness` but for public values.

### Method zero\_wire

`fn zero_wire(&self, m: &NatType) -> Wire;`

Construct wire that won't be used.

### Method clone\_wire

`fn clone_wire(&self, w1: &Wire) -> Wire;`

Clone a wire.
Both input and output wire will be deallocated separately.
If the underlying wire representation is a raw pointer the clone will have
to either copy the pointed data or deal with reference counting.
Input and output have the same modulus.

### Method copy\_bool

`fn copy_bool(&self, m: &NatType, w1: &Wire) -> Wire;`

Semantically identical to `clone_wire` where wires have modulus `2`.
Internally used to make sure that textual IR1 output is identical to our earlier versions.

### Method drop\_wire

`fn drop_wire(&self, wire: &mut Wire);`

Deallocate a wire.
Called automatically when the wire goes out of scope.
This method should free any memory that is not freed automatically.

## Handling wire ranges

The methods `declare_new_wire_range` and `declare_delete_wire_range` are optional and are not called from the frontend, they are intended to be called from the backend itself. They are used only by
backends that implement `AllocationTrait`.

The other methods are required only if the backend supports wire ranges.

### Method zero\_wire\_range

`fn zero_wire_range(&self, m: &NatType, n: usize) -> WireRange;`

Construct a wire range of length n that won't be used.

### Method clone\_wire\_range

`fn clone_wire_range(&self, wr: &WireRange) -> WireRange;`

Clone a range of wires.

### Method index\_wire\_range

`fn index_wire_range(&self, wr: &WireRange, i: usize) -> Wire;`

Index a range of wires, returning the wire with index `i`. The first wire in a range has index `0`.

### Method slice\_wire\_range

`fn slice_wire_range(&self, wr: &WireRange, ir: &IndexRange) -> WireRange;`

Slice a range of wires. The struct `IndexRange` is defined in `sieve.rs` as follows:
```
pub struct IndexRange {
    pub first: usize,
    pub length: usize,
}
```
giving the index of the first wire and the length of the slice.

### Method wire\_to\_wire\_range

`fn wire_to_wire_range(&self, w: &Wire) -> WireRange;`

Convert a wire into a length-1 wire range.

### Method drop\_wire\_range

`fn drop_wire_range(&self, wr: &mut WireRange);`

Drop a wire range. Called automatically when the wire range goes out of scope.
This method should free any memory that is not freed automatically.

### Method create\_vector

`fn create_vector(&self, m: &NatType, wocs: Vec<WireOrConst>) -> WireRange;`

Copy wires or constant values to fresh wires in a wire range,
so that they can be used in vectorized operations.

### Method declare\_new\_wire\_range

`fn declare_new_wire_range(&self, alloc: &Allocation);`

Allocate a range of wires.

### Method declare\_delete\_wire\_range

`fn declare_delete_wire_range(&self, alloc: &Allocation);`

Deallocate a range of wires.

## Sieve functions and plugins

These methods are optional.

Functions defined with the `sieve` keyword in ZK-SecreC code are defined in the backend by first calling the method `begin_function`, then calling the methods corresponding to the body of the
function, and then calling the method `end_function`. The backend should not execute the methods called between `begin_function` and `end_function` calls immediately but save them as a function
definition and execute them when the defined function is later called using `apply`, `vectorized_apply`, or `switch_apply`. If necessary, the backend may use a different implementation of `WireTrait`
for wires inside a function definition than for ordinary wires, as is done in the dummy backend.

Plugins (`extended_arithmetic`, `vectors`, `permutation_check`) can be supported through the methods `plugin_apply` and `plugin_apply_wr`.
The semantics and a sample implementation of those plugins can be seen in the code of the dummy backend.

The `disjunction` plugin is special and uses the method `switch_apply` instead, also requiring support for sieve functions.
The `iter` plugin is also special and uses `vectorized_apply`.

### Method begin\_function

`fn begin_function(&self, sieve_fn: &String, output_moduli: &Vec<&NatType>, input_moduli: Vec<&NatType>) -> (Vec<Wire>, usize);`

Begin a sieve function definition.
Returns wires corresponding to the inputs
and a UID for the sieve function (which must be different each time `begin_function` is called).

### Method end\_function

`fn end_function(&self, wires_res: Vec<WireOrConst>);`

End a sieve function definition.
`wires_res` contains for each return value the wire where it was computed or a constant if this return value is constant.

### Method apply

`fn apply(&self, uid: usize, output_moduli: Vec<&NatType>, input_wires: Vec<&Wire>) -> Vec<Wire>;`

Apply a sieve function with the given uid in a non-vectorized way
to the values on the input wires.

### Method vectorized\_apply

`fn vectorized_apply(&self, uid: usize, output_moduli: Vec<&NatType>, input_moduli: Vec<&NatType>, env_moduli: &Vec<NatType>, env_wires: Vec<&Wire>, wrs: Vec<&WireRange>) -> Vec<WireRange>;`

Apply a sieve function with the given uid in a vectorized way to the values on the input wire ranges `wrs`.
The function is first partially applied to the wires in `env_wires` and resulting function is then applied in a vectorized way to `wrs`.

Each wire range in `wrs` has the same length and the output wire ranges must also have the same length.
The values of the *i*th elements of the output wire ranges are obtained by applying the sieve function to the values of the wires in `env_wires` and the values of the *i*th elements of the wire ranges
in `wrs`.

### Method switch\_apply

`fn switch_apply(&self, sieve_fns: &Vec<usize>, default_sieve_fn: usize, ints: &Vec<Integer>, w_modulus: &NatType, output_moduli: Vec<&NatType>, input_moduli: Vec<&NatType>, w: &Wire, wires: Vec<&Wire>, witness_count: u64) -> Vec<Wire>;`

Apply one of the sieve functions with uids in `sieve_fns` in a non-vectorized way
to the values on the input wires.
The disjunction plugin is used to choose which function to apply according to
which value in `ints` (if any) the value on wire `w` is equal to.
If it is not equal to any, the default function (with uid `default_sieve_fn`) is chosen.

`witness_count` is the maximum number of witness values used by any of the given functions. If the chosen function uses fewer witness values then the witness stream has been padded with arbitrary
values (e.g. zeroes) so that the number of values in the witness stream does not leak the chosen branch. The implementation of `switch_apply` must also remove those extra values from the witness stream,
not just the witness values actually used by the chosen function.

### Method plugin\_apply

`fn plugin_apply(&self, plugin: &str, operation: &str, params: Vec<&str>, modulus: &NatType, num_outputs: usize, input_wires: Vec<&Wire>) -> Vec<Wire>;`

Apply a plugin operation that uses a single modulus and has single wires as inputs and outputs.

### Method plugin\_apply\_wr

`fn plugin_apply_wr(&self, plugin: &str, operation: &str, params: Vec<&str>, modulus: &NatType, output_counts: Vec<usize>, input_wrs: Vec<&WireRange>) -> Vec<WireRange>;`

Apply a plugin operation that uses a single modulus and has wire ranges as inputs and outputs.

## Other methods

These are optional.

### Method write\_headers

`fn write_headers(&self, ns: &Vec<NatType>, supported_conversions: Vec<(&NatType, &NatType)>, supported_plugins: Vec<&str>);`

Write IR headers if they could not be written yet
when the struct implementing this trait was allocated.
`ns` is the list of fields used in the circuit.
`supported_conversions` is the list of conversions between fields supported in the circuit,
the first element of the pair is the input field and the second element is the output field of the conversion.
`supported_plugins` is the list of names of supported plugins.

### Method get\_next\_wire\_number

`fn get_next_wire_number(&self) -> u64;`

For profiling how many wires are used in each part of the code.

### Method get\_rel\_file\_size

`fn get_rel_file_size(&self) -> u64;`

For profiling how many lines of relation file are generated in each part of the code.

### Method flush

`fn flush(&self);`

Flush output.
Useful for text-based implementations like IR output.

### Method finalize

`fn finalize(&self);`

Signal that code execution is finished.

### Method current\_status

`fn current_status(&self) -> bool;`

This does not seem to be used anywhere.
