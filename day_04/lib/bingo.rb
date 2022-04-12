# frozen_string_literal: false

require_relative 'board'

# bingo class
class Bingo
  attr_reader :boards

  # What to do?
  # I have a .txt file containing the numbers as well as all the boards
  # 1. The first line of the .txt file contains the numbers -> Save in an array
  # 2. Read from that file and create boards accordingly
  # 3. Loop through the array of numbers until bingo is received in one of the boards

  def initialize
    @numbers = read_numbers
    @boards = read_boards
  end

  def play
    # Play
  end

  def read_numbers
    File.open('../input/test_input.txt', &:readline)
  end

  # rubocop:disable Metrics/MethodLength
  def read_boards
    boards = []
    temp = []
    File.open('../input/test_input.txt').readlines.each_with_index do |line, index|
      next if index.zero? || index == 1

      if line.strip.empty?
        boards << Board.new(temp)
        temp = []
      else
        temp << line.split.map(&:to_i)
      end
    end
    boards << Board.new(temp)
    boards
  end
end
# rubocop:enable Metrics/MethodLength
b = Bingo.new
#b.boards.each do |row|
#  puts "#{row}\n"
#end

puts "\n\n"

puts 'First board'
puts b.boards[0]
puts "\n\n"

puts 'Second board'
puts b.boards[1]
puts "\n\n"

puts 'Third board'
puts b.boards[2]
puts "\n\n"
