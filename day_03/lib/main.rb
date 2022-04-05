# frozen_string_literal: false

# gamma rate is the most common bit
# epsilon rate is the least common bit
# convert the two to decimal and multiply
# to receive the power consumption

array = []

File.open('../input/input.txt').readlines.each do |line|
  array << line.chomp
end

ctr = Array.new(array[0].size, 0)
i = 0
array.each do |e|
  e.split(//).each do |val|
    ctr[i] += 1 if val == '1'
    i += 1
  end
  i = 0
end

gamma = ''
epsilon = ''

ctr.each do |val|
  if val > array.size / 2
    gamma << '1'
    epsilon << '0'
  else
    gamma << '0'
    epsilon << '1'
  end
end

puts "power consumption: #{gamma.to_i(2) * epsilon.to_i(2)}"
