# frozen_string_literal: false

# board class
class Board
  def initialize
    @board = create_board('../input/test_input.txt')
  end

  def create_board(file)
    matrix = Array.new(5)
    ai = 0
    File.open(file).readlines.each_with_index do |line, index|
      next if index.zero? || line.strip.empty?

      matrix[ai] = line.split.map(&:to_i)
      ai += 1
      break if ai == 5
    end
    matrix
  end

  def check_number(number)
    @board.each_with_index do |row, i|
      row.each_index do |j|
        @board[i][j] = 'X' if @board[i][j] == number
      end
    end
  end

  def bingo?
    @board.each do |row|
      return true if row.count('X').eql? 5
    end
    false
  end

  def print_board
    @board.to_a.each { |r| puts r.inspect }
  end
end

