# frozen_string_literal: false

input = File.read('input.txt').split("\n")

a = {'up' => 0, 'down' => 0, 'forward' => 0}
input.each do |element|
  a[element.split(' ')[0]] += element.split(' ')[1].to_i
end

puts a['forward'] * (a['down'] - a['up'])