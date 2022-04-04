# frozen_string_literal: false

input = []

File.open('../input/input.txt').readlines.each do |line|
  input << line.chomp.to_i
end

# part 1
ctr = 0
(1..input.size - 1).each do |val|
  ctr += 1 if input[val - 1] < input[val]
end

puts "part 1 #{ctr}"
# a.combin  ation(2) {|combination| p combination }
# part 2
ctr2 = 0
prev = 0
(0..input.length).each do
  b = input[_1..(_1 + 2)]
  break if b.length < 3

  ctr2 += 1 if b.sum > prev
  prev = b.sum
end

# Need to reduce the result by 1. Since prev is initialized to 0
puts "part 2 #{ctr2 - 1}"
