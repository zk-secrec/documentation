# Interfacing the ZK-SecreC Compiler with ZK Backends

When the ZK-SecreC compiler compiles a ZK-SecreC program, it can produce a circuit in a certain IR but it can also call a ZK backend (which executes the ZK protocols) directly. Support for new backends (either backends producing a different IR or backends executing the ZK protocols) can be added to the ZK-SecreC compiler by implementing a certain Rust trait for that backend.

The trait is called `SIEVEIR` and is defined in `src/Rust/zksc-app-lib/src/sieve.rs`.

## The dummy backend

There is a simple implementation of the `SIEVEIR` trait that can be used as an example when implementing the trait for a new backend. This simple backend is called the dummy backend and is implemented in `src/Rust/zksc-dummy/src/main.rs`. It runs the circuit operations locally instead of executing ZK protocols or generating IR. It also makes many correctness checks but is not optimized for efficiency, so it may be slow.

## The trait for wires

There is a notion of *wire*, meaning a scalar value that is on a circuit, i.e. a scalar value that is in `$post` stage. Each backend may handle wires differently. For example, backends producing an IR may have unique number for each wire, while backends executing ZK protocols may have a certain structure in memory to represent each wire.

There is a trait `WireTrait`, defined in `sieve.rs`, that must be implemented for each backend according to how it represents wires internally.

There is also a struct `Wire`, which is a trait object of the trait `WireTrait`. Objects of the type `Wire` are given as arguments and returned from many methods of the `SIEVEIR` trait.

Implementing `WireTrait` for a datatype that represents the wire internally is not difficult. The datatype must derive the `Debug` trait and implement `WireTrait` as follows (where `WireImpl` is the datatype representing the wire):
```
impl WireTrait for WireImpl {
    fn to_any(&self) -> &dyn Any {
        self as &dyn Any
    }
}
```

The implementation of `to_any` is the same for each datatype but it cannot be made into a default implementation because then it would convert the polymorphic type (`&dyn WireTrait`) rather than the monomorphic type (`&WireImpl`) into `&dyn Any` and then it cannot be converted back to the monomorphic type `&WireImpl`.

When implementing methods of the `SIEVEIR` trait that take as argument or return objects of type `Wire`, it is usually necessary to convert the objects from type `Wire` to the concrete type implementing `WireTrait`, as well as back from the concrete type to `Wire`. Converting from the concrete type to `Wire` can be done using the polymorphic function `upcast_wire`, defined in `sieve.rs`. The function that converts from `Wire` to the concrete type needs to be defined for each concrete type separately as follows:
```
fn downcast_wire(w: &Wire) -> &WireImpl {
    w.downcast::<WireImpl>()
}
```
where `WireImpl` is the concrete type implementing `WireTrait`. There is also a function `upcast_wires` (and `downcast_wires` if defined for the given type), converting vectors of wires instead of single wires.

## Wire ranges

There is also a notion of *wire range*, meaning a vector of wires, i.e. a vector of scalar values in the `$post` stage. Wire ranges may also be handled differently in each backend. For example, backends producing an IR may have a contiguous range of numbers for each wire in the wire range, while backends executing ZK protocols may have some structure in memory that is more efficient than having a separate data structure for each wire in the wire range.

There is a trait `WireRangeTrait`, defined in `sieve.rs`, that must be implemented for each backend that supports wire ranges. Supporting wire ranges is not compulsory but is recommended for efficiency. The ZK-SecreC compiler supports automatic unrolling of vectorized operations, which replaces wire ranges with the individual wires in the range, and can be used for backends that do not support wire ranges.

Similarly to wires, there is also a struct `WireRange`, which is a trait object of the trait `WireRangeTrait`. Objects of the type `WireRange` are given as arguments and returned from several methods of the `SIEVEIR` trait.

Implementing `WireRangeTrait` for a datatype that represents the wire internally is similar to implementing `WireTrait`. The datatype must derive the `Debug` trait and implement the method `to_any` in the same way as for `WireTrait`. In addition, it must implement the method `length` that returns the number of wires in a wire range.

Converting from a concrete type implementing `WireRangeTrait` to `WireRange` and back is similar to wires, using `upcast_wr`, defined in `sieve.rs`, and `downcast_wr`, defined for each concrete type as follows:
```
fn downcast_wr(wr: &WireRange) -> &WireRangeImpl {
    wr.downcast::<WireRangeImpl>()
}
```
where `WireRangeImpl` is the concrete type implementing `WireRangeTrait`. There is also a function `upcast_wrs` (and `downcast_wrs` if defined for the given type), converting vectors of wire ranges instead of single wire ranges.

## Types used in SIEVEIR method signatures

Many of the arguments and return values of the methods of the SIEVEIR trait are of types that are defined in the Rust part of the ZK-SecreC compiler, rather than standard Rust types.

The types `Wire` and `WireRange` were described above.

The type `IndexRange` is described under the method `slice_wire_range`, which is the only method where it is used.

The other types are described here.

### The type Integer

`Integer` is a type synonym (defined in `integer.rs`) for `BigInt` from `num_bigint`. It is used for integer constant arguments of `SIEVEIR` methods.

### The type Value

The type `Value` represents any ZK-SecreC value but here it is assumed to be a scalar (integer or boolean) `$pre` value.
It is used for values that are added to instance or witness streams (and from there to wires), or for public constants loaded directly onto wires.
It is a reference-counted object that can be cloned in constant time to turn `&Value` into `Value` if necessary.

It is possible to branch over whether the `value` `v: &Value` with modulus `m: &NatType` is an integer or a boolean and extract the value as a `bool` or a `BigInt`, using
```
match v.view() {
    ValueView::ZkscDefined() => { /* integer with value n: BigInt */
	let n: BigInt = (m.to_bigint)(v);
	...
    }
    ValueView::Bool(b) => { /* boolean with value b: bool */
	...
    }
    _ => panic!("Not an integer or boolean"),
}
```
The type `NatType` is described in the next section. Here we use the method `to_bigint` of the modulus `m: &NatType`. Other methods of `NatType` can also be used to handle values of type `Value`.
The full definition of `Value` (in `value.rs`) is complex and is not needed to implement the `SIEVEIR` trait, so it will be omitted here.

### The type NatType

`NatType` denotes a modulus of wires and values, including inputs and outputs of `sieve` functions and plugins. It is defined in `zksc_types.rs` as a struct with methods as its fields:
```
pub struct NatType {
    pub tag: u64,
    pub modulus: Option<BigInt>,
    pub modulus_value: fn() -> Value,
    pub modulus_limbs_le: Option<&'static [usize]>,
    pub is_zero : fn(&Value) -> bool,
    pub is_one : fn(&Value) -> bool,
    pub eq : fn(&Value, &Value) -> bool,
    pub lt : fn(&Value, &Value) -> bool,
    pub add : fn(&Value, &Value) -> Value,
    pub mul : fn(&Value, &Value) -> Value,
    pub sub : fn(&Value, &Value) -> Value,
    pub div: fn(&Value, &Value) -> Value,
    pub hmod: fn(&Value,&Value) -> Value,
    pub mod_div : fn(&Value,&Value) -> Value,
    pub to_bigint: fn(&Value) -> Integer,
    pub from_bigint: fn(&Integer) -> Value,
    pub fmt: fn(&Value, &mut fmt::Formatter<'_>) -> fmt::Result,
    pub from_limbs_le: fn(&[usize]) -> Value,
}
```
For implementing the `SIEVEIR` trait, only the method `to_bigint` and the fields `modulus` and `tag` are useful.

The method `to_bigint` was used in the previous section about `Value` and extracts the integer from a `&Value`.

The field `modulus` contains `Some(m)` where `m` is the modulus as a `BigInt` if the modulus is finite. If the modulus is infinite then `modulus` is `None` but this should not occur with the moduli given to `SIEVEIR` trait methods since these moduli are used in the circuit.

The field `tag` is different for each modulus used in the `ZK-SecreC` program and can be used to check more efficiently whether two moduli are equal by comparing the `u64` tags instead of the `BigInt` moduli.

### The type WireOrConst

The enum `WireOrConst` is used for creating a vector or returning values from a function and is defined in `sieve.rs` as follows:
```
pub enum WireOrConst<'a> {
    W(&'a Wire),
    C(Integer),
}
```
allowing each value in the vector or returned from a function to either be copied from an existing wire or be a constant.

### The type Allocation

The type `Allocation` is a trait object of the trait `AllocationTrait` (defined in `sieve.rs`), similarly to `Wire` and `WireRange`. It is used for backends that support allocating a wire range without immediately assigning values to the wires in the range. The following SIEVEIR method calls that return new wires will take those wires from this allocated range until all wires of the range have been assigned values. The wire range can be deallocated as a whole when all wires in the range have gone out of scope.

Implementing `AllocationTrait` and the methods that use the type `Allocation` is optional.
