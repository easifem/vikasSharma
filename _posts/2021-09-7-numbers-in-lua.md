---
title: 'Numbers in Lua'
tags: [Lua]
style: border
color: primary
description: Day-2 of programming in Lua <i class="fas fa-terminal text-warning"></i>. In this note, I have explained my understanding about the number system in Lua.
---

# Numbers in Lua

Lua uses two alternative representations for numbers:

- Double precision, 64-bit, floating-point numbers
- 64-bit, integer numbers

> Note that floats, reals, or double-precision implies 64-bit real numbers in Lua

Declaring real numbers

```lua
a=1.0
a=1.0e+0
a=1.0e0
a=1.0E0
a=1.0E+0
```

Declaring integer numbers

```lua
a=4
```

> Numerals with a decimal point or an exponent are considered floats; otherwise, they are treated as integers.

The type of real or integer number is always `number` in Lua. In this way integers and floats can be compared in Lua as shown below.

```lua
2 == 2.0 --> true
-6 == -6.0 --> true
```

We can also mix integers and reals in mathematical operations.

```lua
1 + 1 --> 2
1 + 1.0 --> 2.0
1.0 + 1.0 --> 2.0
1.0 * 2 --> 2.0
```

> Division of two integer numbers is a real number as shown below

```lua
3/2 --> 1.5
3.0 / 2 --> 1.5
3.0 / 2.0 --> 1.5
```

For integer division, Lua provides `//` operator, which works as follows.

```lua
3//2 --> 1
1//2 --> 0
-9 // 2 --> -5 which is floor(-4.5)
```

Modulo operator is given by `%`, which works as follows.

```lua
3 % 2 --> 1
4.0 % 1.2 --> 0.4
```

## Relational operators

-   `>` greater than
-   `<` lesser than
-   `<=` lesser than and equal to
-   `>=` greater than and equal to
-   `==` equal
-   `~=` not equal

## Math library

Lua math library contains several functions. Some of these functions are given below.

```lua
math.random()
math.randomseed()
math.floor()
math.ceil()
```

## Conversion

We can convert real to integer by using a function called `math.tointeger`. Note that this function can be used only when a real number has integer representation. See the example given below.

```lua
math.tointeger(1.0) --> 1 works
math.tointeger(1.2) --> error, does not work
```