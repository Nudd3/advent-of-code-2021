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

puts horizontal * depth
# down X increases your aim by X units.
# up X decreases your aim by X units.

# forward X does two things:
# It increases your horizontal position by X units.
# It increases your depth by your aim multiplied by X.
# Part 1: 1762050

horizontal = 0
depth = 0
aim = 0
input.each do |element|
  command = element.split(' ')
  case command[0]
  when 'forward'
    horizontal += command[1].to_i
    depth += (aim * command[1].to_i)
  when 'down' then aim += command[1].to_i
  else aim -= command[1].to_i
  end
end

puts horizontal * depth