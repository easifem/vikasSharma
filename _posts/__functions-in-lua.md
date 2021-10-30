---
title: Functions in Lua
---

# Functions in Lua

Lua program can use functions defined both in Lua and in C.

## Declaration of function

```lua
function name_of_function(arg1, arg2)
    --> body of the function
    --> return statement
end
```

Some examples are given below

```lua
printTable(atable)
  for i=1,#atable do
    print( "atable(" .. i .. ")=", atable[i] )
  end 
end
```


### No return function

```lua
function foo(a,b) print(a,b) end
```

> We can call a function with a number of args different from its number of parameters. Lua will adjust the number of arguments for us.


```lua
foo() --> nil nil
foo(1) --> 1 nil
foo(1,2) --> 1 2
foo(1,2,3) --> 1,2
```

## Default value of arguments

We can set the default value of an arguments by using following strategy.

```lua
function foo(a)
    a = a or 3
end
```

In the above function if a is not present then it has a default value of 3.

## How multiple results works

Lua function can return no value, single value or multiple values. See the example given below

```lua
function foo0() end
function foo1() return 1 end
function foo2() return 1,2 end
```

> When we call a function as a statement, Lua discards all results from the function.

> When we call a function as an expression, Lua keeps only the first result.

> We get all the results only when the call is the last expression in a list of expressions.

```lua
x,y=foo2() --> x=1, y=2
x=foo2() --> x=1
x,y,z=foo2() -->x=1,y=2,z=nil
x,y,z=10,foo2() --> x=10, y=1, z=2
x,y,z=foo2(),10 --> x=1,y=10, z=nil
```