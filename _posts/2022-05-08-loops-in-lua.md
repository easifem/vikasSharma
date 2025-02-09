---
title: Loops in Lua
author: Vikas Sharma, Ph. D.
date: 8 May 2022
upadte: 8 May 2022
tags: [Lua]
style: border
color: primary
description: Day-7 of programming in Lua <i class="fas fa-terminal text-warning"></i>. In this note, I discuss Branches and Loop in Lua.
---

# IO in Lua

In this post I will describe my understanding of input and output operations in Lua. In any programming language we have two types of input or output devices (sometimes they are also called buffer); standard devices and user specified devices.

- Standard output (`stdout`) and input  (`stdin`) buffers are usually terminal window and keyboard, respectively.
- User defined IO-buffers can be external files or internal file: the former is located on the hard-disk of the computer, and the latter remains in the memory of the running computer program.


## Changing the current input stream

```lua
io.input(filename)
```

will change the current input stream to the external file named `filename`.


```lua
io.output(filename)
```

will change the current output stream to the external file named `filename`


## IO.WRITE

The function `io.write` writes to the output stream.

> As a rule we should avoid using `print()` function, and always use `io.write()` function as it gives us a full control over the output.

Example of `io.write`

```lua
io.write( string.format( "3.0/2.0 = %.4f \n", 3.0/2.0 ) )
```

## IO.READ

The function `io.read()` reads from the input stream.

- `io.read("a")` reads the whole file starting at its current position. If we are at the end of the file, or the file is empty, then this function returns an empty string.

- `io.read("n")` reads a number
- `io.read("num")` reads a number as a string
- `io.read("l")` reads the next line without the newline char `\n`. when we reach the end of file then this function returns `nil`.
- `io.read("L")` reads the next line with the newline char `\n`
- `io.read(n)`, where n is a number, it reads n character from the input stream.

Also see, `io.lines()`

## Opening a file

To open a file we use `io.open(filename, mode)`. Where we provide filename and mode (read, write).
For reading an existing file we use `mode=r`, and for writing to a file we use `mode=w`. We use `mode=a` for appending to an existing file. A good way to open a file is following.

```lua
local f = assert( io.open( filename, mode ) )
```

To read this file we use the `read` method, which can be access by `:` as shown below.

```lua
local t = f:read("a")
```

To close the file we use `close` method.


To read from the standard input we can use following:

```lua
io.stdin:read("a")
```

To write to the standard output we can use the following:

```lua
io.stdout:write()
```

To print error we can use

```lua
io.stderr:write()
```

Note the following:

- `io.write()` is short for `io.output:write()`
- `io.read()` is short for `io.input:read()`

We can change the `io.input` or `io.output` temporally using

```lua
local temp = io.input()
io.input("filename")
io.input:read()
io.read() -- alternative
io.input:close()
io.input(temp) -- restore original
```

## Data files

```lua
--- data.lua

Entry{
author = "Donald E. Knuth",
title = "Literate Programming",
publisher = "CSLI",
year = 1992
}

Entry{
author = "Jon Bentley",
title = "More Programming Pearls",
year = 1990,
publisher = "Addison-Wesley",
}
```

```lua
local authors = {}
-- a set to collect authors
function Entry(b) authors[b.author] = true end

dofile("data.lua")
for name in pairs(authors) do print(name) end
```

## Serialization

- [ ]  TODO





