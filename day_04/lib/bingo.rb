# frozen_string_literal: false

require_relative 'board'

# bingo class
class Bingo
  attr_reader :boards, :numbers

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
    index = 0
    @numbers.each do |number|
      index += 1
      @boards.each do |board|
        board.check_number(number)
        return {board: board, number: number} if board.bingo?
      end
    end
  end

  def read_numbers
    numbers = File.open('../input/input.txt', &:readline)
    numbers.strip.split(',').map(&:to_i)
  end

  # rubocop:disable Metrics/MethodLength
  def read_boards
    boards = []
    temp = []
    File.open('../input/input.txt').readlines.each_with_index do |line, index|
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
winner = b.play

winning_board = winner[:board]
winning_number = winner[:number]

# b = a.select { |v| v.is_a? Integer }.sum
sum = winning_board.board_sum
puts sum * winning_number