=begin
def pyramid(height)
  height.times {|n|
    print ' ' * (height - n)
    puts '*' * (2 * n + 1)
  }
end
pyramid 3
-------------
=end

def pyramid(height)
 height.times do |n|    
   print ' ' * (height - n)
   puts '*' * (2 * n + 1)
 end
end
pyramid 3