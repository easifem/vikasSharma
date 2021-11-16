-- test for function in lua
--
-- define a function
function printTable(atable)
  for i=1,#atable do
    print( "atable(" .. i .. ")=", atable[i] )
  end
end
-- test printTable
printTable({1,2,3,4,5})

-- function foo
function foo(a,b) print(a,b) end

-- test function foo

foo(1,1)
foo("hello", " world")
foo("hello", 1 )


-- non matching args

foo() --> nil nil
foo(1) --> 1 nil
foo(1,2) --> 1 2
foo(1,2,3) --> 1,2

-- default value
--
function foo(a)
    local b = a or 3
    print( 'foo( ', a or ' ', ' )=', b )
end

foo(1)
foo( 'hello world' )
foo( )

--[==[
foo( 	1	 )=	1
foo( 	hello world	 )=	hello world
foo( 	 	 )=	3
--]==]

-- multi return
--
function foo0() end
function foo1() return 1 end
function foo2() return 1,2 end

-- call
x,y=foo2()
print('x=',x, ' y=',y)


-- call
x,y,z=10,foo2() --> x=10, y=1, z=2
print('x=',x, ' y=', y, ' z=', z)


-- call
x,y,z=foo2(),10 --> x=1,y=10, z=nil
print('x=',x, ' y=', y, ' z=', z)


--call
print('x,y =', foo2(  ))

--call

print("ans=", foo1()+foo2())
