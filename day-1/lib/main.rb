# frozen_string_literal: false

lines = []
File.open('input.txt').readlines.each do |line|
  lines << line.chomp.to_i
end

increase_counter = 0

lines.each_with_index do |value, index|
  next if index.zero?

  increase_counter += 1 if value > lines[index - 1]
end

puts increase_counter