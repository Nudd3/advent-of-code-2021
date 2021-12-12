# frozen_string_literal: false

input = File.read('input.txt').split("\n")

horizontal = 0
depth = 0
input.each do |element|
  command = element.split(' ')
  case command[0]
  when 'forward' then horizontal += command[1].to_i
  when 'down' then depth += command[1].to_i
  else depth -= command[1].to_i
  end
end

puts "Horizontal: #{horizontal}"
puts "Depth: #{depth}"
puts horizontal * depth

# Part 1: 1762050
