# frozen_string_literal: false

# board class
class Board
  def initialize(array)
    @board = array
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

  def board_sum
    @board.flatten.select { |v| v.is_a? Integer }.sum
  end

  def to_s
    str = ''
    @board.each do |row|
      str << "#{row}\n"
    end
    str
  end
end
