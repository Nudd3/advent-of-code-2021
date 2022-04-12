# frozen_string_literal: false

require_relative 'board'

class Bingo

  # What to do?
  # I have a .txt file containing the numbers as well as all the boards
  # 1. The first line of the .txt file contains the numbers -> Save in an array
  # 2. Read from that file and create boards accordingly
  # 3. Loop through the array of numbers until bingo is received in one of the boards

  def initialize
    @numbers = read_numbers
    @bards = read_boards
  end

  def play
    # Play
  end

  def read_numbers
    File.open('../input/test_input.txt', &:readline)
  end

  def read_boards

  end

end

b = Bingo.new
