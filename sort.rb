#!/usr/bin/env ruby

def qsort(data)
  return if data.length < 2
  pivot = data.first
  left = data[1..].select { |x| x < pivot }
  right = data[1..].select { |x| x >= pivot }
  qsort(left)
  qsort(right)
  i = 0
  left.map { |x| data[i] = x; i += 1 }
  data[i] = pivot
  right.map { |x| data[i] = x; i += 1 }
end

# Setup
data = (1..100).map {|_| rand(100)}

# Process
qsort(data)

#Output
puts data.join("\t")
