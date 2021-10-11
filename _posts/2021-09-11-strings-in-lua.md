---
title: 'Strings in Lua'
tags: [Lua]
style: border
color: primary
description: Day-3 of programming in Lua <i class="fas fa-terminal text-warning"></i>. In this note, I have explained my understanding about the string system in Lua.
---

# Strings in Lua

- String in Lua is a sequence of bytes.
- We can store any binary data into strings
- UTF-8 and UTF-16 encoding are supported in Lua

> Strings in Lua are immutable, which means we cannot change the string after creating, but we can copy it and resign it to some other or same variable

## String literal

```lua
a="Hello world"
```

## Length of string

```lua
a="Hello world"
print(#a) --> 11
```

`#` operators return the size in bytes. Because each char in string is a byte long, we can use `#` to get the number of chars in string.

> Note getting number of chars using `#` works fine in the case of ASCII strings.

## Concatenating two strings

`..` operator concatenate two strings. 

```lua
a = "hello" .. " world" --> hello world
```

We can concatenate a string and number

```lua
a = "today is " .. 11 .. " Oct " .. 2021
b = "3/2 is = " .. 1.5
```


## Writing long strings

To write long strings we use `[[` `]]` operator

```lua
alongMessage = [[
program main
implicit none
write(*,*) "hello world"
end program main
]]
```

Some times, when we are using Lua code as string, then we may face a problem if Lua code contains comments using `--[[` `--]]` . Therefore we use `[=[` and `]=]` operator for writing strings.

> You can use any number of `=` symbol in between `[[` and `]]` , however, the opening and closing brackets should have the same number of  equal sign.

```lua
alongMessage = [==[
program main
implicit none
write(*,*) "hello world"
end program main
]==]
```

## Converting numbers to string

`tostring()` function can convert a number into a string.

`tonumber()` function can convert a string into a number.

## Standard string library

| method           | interface           | comment                                                               | use                              |
| ---------------- | ------------------- | --------------------------------------------------------------------- | -------------------------------- |
| string.len()     | string.len(aString) | returns length of string                                              | string.len("hello")              |
| string.rep()     | string.rep(s,n)     | returns a string after repeating s, n times                           | string.rep("0",5)                |
| string.reverse() | string.reverse(s)   | reverse a string                                                      | string.rev("hello")              |
| string.lower()   | string.lower(s)     | lower case version of string s                                        | string.lower("AAA")              |
| string.upper()   | string.upper(s)     | uppercase version of string s                                         | string.upper("aaa")              |
| string.sub()     | string.sub(s,i,j)   | extracts a piece of the string s, from the i-th to the j-th character | string.sub("hello world", 1, -1) |
| string.char()    | string.char(s)      | converts an ascii code s to ascii char                                | string.char(96)                  |
| string.byte()    | string.byte(s)      | converts ascii char to ascii code                                     | string.byte("A")                 |


`string.byte("hello world", 1, -1)` will convert all char in the string to ascii code and return a list of integers.

```lua
string.byte("hello world", 1, -1)
--> 104	101	108	108	111	32	119	111	114	108	100
```

There is another interesting string function called, `string.format()` for formatting strings and converting numbers to strings.

```lua
string.format("day=%d, month=%d, year=%d", 11, 9, 2021)
--> day=11, month=9, year=2021
```

This function follows the rules of `printf` function of C language.