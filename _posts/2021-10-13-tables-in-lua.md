---
title: 'Tables in Lua'
tags: [Lua]
style: border
color: primary
description: Day-4 of programming in Lua <i class="fas fa-terminal text-warning"></i>. In this note, I have explained my understanding about the table data type in Lua.
---

# Tables in Lua

- Tables in Lua container type data-structure
- They can be employed to represent arrays, sets, records, among other type of data-types.
- We can access the entries of a table using index or key.
- Even, Lua modules/ library can be represented as a Lua table.
- Tables in Lua are dynamically allocated objects

> Under the hood, Lua never makes hidden copies of new tables, like other languages like python 😡

> `{}` is the table constructor in Lua.

For example

- Creating empty table

```lua
a={}
```

- Adding entries of table "on the fly"


```lua
a["x"]=10
k="y"
a[k]=20
```

- Getting the values from table

```lua
print(a["x"]) -- we will get 10
a["y"] -- we will get 20
```

- We can also use numbers as key

```lua
a[4]="hello world"
```

> A table is always anonymous. There is no fixed relationship between a variable that holds a table and table itself.

```lua
a={}
a["x"]=1.0
a["y"]=2.0
a["z"]=3.0
b = a -- both b and a point to same data, no separate table.
a=nil --> nullify a, do not worry b is still there
b=nil --> now b is gone, we cannot have table entries now :()
```

> When there is no references to a table/ object, then garbage collector comes and clean the space occupied by that object. In this way, as a user we do not have to worry about the memory leak.

- We can use `a.name` instead of `a["name"]` to access the element from table which has key `name`. Therefore, in above example `a.x` will given us 1, and `a.z` with give us `3.0`.

> We can also use floating point as key 🐺.

## Table constructor

We have already seen the empty table constructor, which is given by `a={}`. We then added entries to the table using `a["x"]=10`, or we can use `a.x=10`.

There is another way to construct the table.

```lua
extlibs={"LAPACK95", "BLAS95", "FACE", "PENF"}
```

the we can access the entries using:

```lua
extlibs[1] --> "LAPACK95"
extlibs[4] --> "PENF"
```

We can also use key-value construct.

```lua
a={x=10, y=10, z=20}
```

then we have

```lua
a["x"] --> 10
a.x --> 10
```

## Removing fields of table

```lua
a={x=10, y=20, z=30, name="point1"}
a.name --> "point1"
a.name = nil --> a.name is gone
```

## Insert an element

```lua
t={}
table.insert(t, 1, 10) --> insert 10 at t[1]
table.insert(t,20) --> insert 20 at t[2]
table.insert(t, "x", 30) --> t["x"] = 30
```

## Removing an element

```lua
t={1,2,3,4}
table.remove(t) --> remove the last element
table.remove(t,1) --> remove first element
```


## Table traversal

We can traverse all key-value pairs in a table with the `pairs` iterator. 

```lua
t={x=10, y=20, z=30}
for k, v in pairs(t) do
  print(k,v)
end
```


