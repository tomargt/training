a = [1,2,3,4]
b = [5,6,7,8,0]
c = []
for i in (0...(a.size))
	c[i] = a [i]
end 
for j in (0...(b.size))
	c[i+1] = b [j]
	i = i+1
end
puts "#{c}"