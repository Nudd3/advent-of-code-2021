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

# Part 2
# Oxygen generator rating:
# Look over all values. Always save the numbers with the most
# CO2 scrubber rating:
# Always save the least

# Works
def oxygen(array)
  index = 0
  a = []
  until a.size == 1
    a = index.zero? ? count(array, index, 'oxygen') : count(a, index, 'oxygen')
    index += 1
  end

  a.join
end

def co2(array)
  index = 0
  a = []
  until a.size == 1
    a = index.zero? ? count(array, index, 'co2') : count(a, index, 'co2')
    index += 1
  end
  a.join
end

def count(array, index, type)
  saved = []
  ones = 0
  zeroes = 0

  array.each do |number|
    number[index] == '1' ? ones += 1 : zeroes += 1
  end

  if type == 'oxygen'
    flag = ones >= zeroes ? '1' : '0'
  else
    flag = ones >= zeroes ? '0' : '1'
  end
  array.each do |number|
    saved << number if number[index] == flag
  end
  saved
end

puts "oxygen: #{oxygen(array).to_i(2)}"
puts "co2: #{co2(array).to_i(2)}"
puts "life support rating: #{oxygen(array).to_i(2) * co2(array).to_i(2)}"