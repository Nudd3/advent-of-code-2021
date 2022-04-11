# frozen_string_literal: false

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
        if @board[i][j] == number
          @board[i][j] = 'X'
        end
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

b = Board.new
b.print_board
b.check_number(13)
b.check_number(22)
b.check_number(17)
b.check_number(11)

puts "\n\n"
b.print_board
puts "bingo? #{b.bingo?}"