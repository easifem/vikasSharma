---
title: 'Functions in Lua'
tags: [Lua]
style: border
color: primary
description: Day-5 of programming in Lua <i class="fas fa-terminal text-warning"></i>. In this note, I have explained my understanding of functions in Lua.
---

# Functions in Lua

Lua programs can use functions defined both in Lua and in C.

## Declaration of function

```lua
function name_of_function(arg1, arg2)
    --> body of the function
    --> return statement
end
```

Some examples are given below

```lua
function printTable(atable)
  for i=1,#atable do
    print( "atable(" .. i .. ")=", atable[i] )
  end
end
-- let us not call this function
printTable({1,2,3,4,5})
```

Results:

```text
atable(1)=	1
atable(2)=	2
atable(3)=	3
atable(4)=	4
atable(5)=	5
```

A function is allowed to return nothing (actually nil).

```lua
function foo(a,b) print(a,b) end
```

Let us call this function

```lua
foo(1,1)
foo("hello", " world")
foo("hello", 1 )
```

Results:

```txt
1	1
hello	 world
hello	1
```

## Variable numbers of arguments

:bulb: We can call a function with a different number of arguments. If we provide more than the required arguments, then Lua will drop the unnecessary arguments. If we provide lesser number of arguments, then Lua will set the missing arguments to `nil`. This is explained below.


```lua
foo() --> nil nil
foo(1) --> 1 nil
foo(1,2) --> 1 2
foo(1,2,3) --> 1,2
```

Results

```txt
nil	nil
1	nil
1	2
1	2
```

## Default value of arguments

We can set the default value of an arguments as shown below.

```lua
function foo(a)
    local b = a or 3
    print( 'foo( ', a or ' ', ' )=', b )
end
```

Call:

```lua
foo(1)
foo( 'hello world' )
foo( )
```


Results:

```txt
foo( 	1	 )=	1
foo( 	hello world	 )=	hello world
foo( 	 	 )=	3
```

In the above function if a is not present then it has a default value of 3.

## How multiple results works

Lua function can return 

- 💎 no value
- 💎 single value
- 💎 multiple values

as shown below.

```lua
function foo0() end
function foo1() return 1 end
function foo2() return 1,2 end
```

🚀 When we call a function as a statement, Lua discards all results from the function.

🚀 When we call a function as an expression, Lua keeps only the first result.

For example, in the code given below function `foo2` returns first entry only.

```lua
print("ans=", foo1()+foo2())
```

Results:

```txt
ans=2
```

🚀 We get all the results from a function when the call to the function is the last expression in a list of expressions.

For example, in the code block shown below the function foo2 will return box x and y, because the call to the function is last in the expression list.

```lua
x,y=foo2()
print('x=',x, 'y=',y)
```

Result:

```txt
x=	1	y=	2
```

Similarly, in the code block given below foo2 will return both the values because the call to the function is last in the expression list.

```lua
x,y,z=10,foo2() 
print('x=',x, ' y=', y, ' z=', z)
```

Result:

```txt
x=	10	 y=	1	 z=	2
```

💀 However, in the code given below the function foo2 will only return single value (that is, 1), because the call to the function is not the last in the list.

```lua
x,y,z=foo2(),10 --> x=1,y=10, z=nil
```

Results:

```txt
x=	1	 y=	10	 z=	nil
```

Try the following and inspect the results.

```lua
print(foo2(  ))
print('x,y =', foo2(  ))
```
