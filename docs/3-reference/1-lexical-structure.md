# Lexical Structure

Lexemes are recognized as the longest sequences of characters matching a token description. If one wants two lexemes that would be interpreted as one when written one after another, they must be separated by whitespace.

## Whitespace

```
<whitespace> ::= <whitechr>+
<whitechr>   ::=   | \n | \r | \f | \t | \v | <unispace>
```

Legal whitespaces of ZK-SecreC consist of one or more whitespace characters. Blank space, line feed, carridge return, form feed, tab and vertical tab are interpreted as whitespace characters. In addition, every Unicode space character fits.

## Comments

ZK-SecreC supports line comments and block comments. Line comments start with two slashes (`//`) and end with a line break. Block comments are opened with `/*` and closed with `*/`. Block comments can be nested.

## Names

### Identifiers

```
<varid>    ::= <idfirst> <idother>*

<idfirst>  ::= <large> | <small>
<idother>  ::= <idfirst> | <digit> | '

<large>    ::= <asclarge> | <unilarge>
<asclarge> ::= [A-Z]

<small>    ::= _ | <ascsmall> | <unismall>
<ascsmall> ::= [a-z]

<digit>    ::= <decdigit> | <unidigit>
<decdigit> ::= [0-9]
```

An identifier is a Unicode string that can contain alphanumeric characters, decimal digits, underscores and apostrophes. Identifiers must begin with an alphanumeric character or an underscore.

### Operators

ZK-SecreC allows defining new operators. Operators consist of one or more characters in the following supply:

```
!#$%&*+/<=>?@\^|-~
```

## Special character sequences

Some character sequences are reserved for special purposes and cannot be used as names of user-defined identifiers or operators.

### Keywords

ZK-SecreC has the following keywords:

`_`
`arr`
`as`
`bool`
`break`
`Challenge`
`continue`
`Convertible`
`dbg_assert_eq`
`dbg_assert`
`default`
`Domain`
`eff`
`else`
`ExtendedArithmetic`
`extern`
`false`
`Field`
`fn`
`for`
`forall`
`if`
`impl`
`in`
`inf`
`infix`
`infixl`
`infixr`
`let`
`list`
`mut`
`Nat`
`PermuatationCheck`
`post`
`pre`
`prover`
`pub`
`public`
`Qualified`
`rec`
`ref`
`return`
`self`
`Self`
`sieve`
`store`
`Stage`
`string`
`struct`
`trace`
`true`
`tuple`
`type`
`uint`
`unchecked`
`unit`
`Unqualified`
`use`
`Vectors`
`Vectorization`
`verifier`
`where`
`while`
`wire`
`with`
`witness`
`zip`

Keywords `self` and `Self` have no purpose in the current version of the language. They are reserved for prospective future extensions. Keyword `witness` is no more used in the language but it is still reserved for giving a proper error message in case it is used in a program.

### Special symbol sequences

There are also symbol sequences that cannot be used as operators since they have other meaning in ZK-SecreC programs:

`->`
`=>`
`@`
`$`
`;`
`::`
`:`
`,`
`=`

Symbol sequences `+`, `*`, `<=`, `!` also have predefined meaning but still serve as builtin operators. In addition, special symbol sequences `.` and `..` are used in ZK-SecreC.

## Parentheses

The following symbol sequences are used as opening delimiters:

`(`
`.(`
`[`
`{`
`{#`
`{##`

Closing delimiters always consist of a single symbol:

`)`
`]`
`}`

When matching the delimiters, all symbols in the opening delimiter other than parentheses are ignored. For instance,

```{ ... .( ... {# ... } ... [ ... ] ... ) ... }```

has balanced delimiters (assuming that there are no delimiters other than those explicitly shown): Delimiters 1 and 2 match with delimiters 8 and 7, respectively, whereas delimiters 3 and 4 match each other and delimiters 5 and 6 match each other.

## Literals

### Unsigned integer literals

Unsigned integer literals can be written as binary, octal, decimal or hexadecimal numbers. Binary, octal and hexadecimal numbers must start with corresponding prefix:

| Prefix | Radix       |
|--------|-------------|
| 0b     | binary      |
| 0o     | octal       |
| 0x     | hexadecimal |

Binary, octal and decimal numbers are written using the usual digit characters. Hexadecimal numbers can also contain letters a-f, either capitalized or not. An integer literal may contain any positive number of digits.

### Boolean literals

There are two built-in boolean literals: `true` and `false`.

### String literals

String literals are delimited by the double quote (`"`) characters. Any double quote characters within the string must be escaped by a backslash character. A backslash itself must be escaped, too. One can use `\n` and `\t` to encode the newline and the tabular character, respectively. It is also allowed to encode characters via their ASCII/Unicode codes in decimal like in `\65`, as well as in binary, octal or hexadecimal notation like in `\b1000001`, `\o101` and `\x41`.

