# frozen_string_literal: false

require_relative 'board'
require_relative 'bingo'

# Part 1
bingo1 = Bingo.new
winner = bingo1.play_part_one
b1 = winner[:board].board_sum
n1 = winner[:number]

puts b1 * n1