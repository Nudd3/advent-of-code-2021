# frozen_string_literal: false

require_relative 'board'
require_relative 'bingo'

# Part 1
bingo1 = Bingo.new
winner1 = bingo1.play_part_one
b1 = winner1[:board].board_sum
n1 = winner1[:number]

puts b1 * n1

# Part 2
bingo2 = Bingo.new
winner2 = bingo2.play_part_two
b2 = winner2[:board].board_sum
n2 = winner2[:number]

puts b2 * n2

bingo2.boards.each do |board|
  puts board
end