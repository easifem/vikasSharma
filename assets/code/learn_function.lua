function printTable(atable)
  for i=1,#atable do
    print( "atable(" .. i .. ")=", atable[i] )
  end 
end

printTable({"hello", "world"})

function foo2() return 1,2 end

x,y=foo2()
print( string.format("%d=1, %d=2",x,y))

x,y,z=10,foo2()
print( string.format("%d=10, %d=1, %d=2",x,y,z))

x,y,z=foo2(),10
print(x,y,z)

