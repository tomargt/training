class double
def array_to_double
array = [1,2,3,4,5,a,b,c]
print array.map { |n| is_numeric? (n) ? n*2:n}
end
def is_numeric? (num)
num.is_a?(fixnum)
end
end
double1=double.new()
double.array_to_double