# frozen_string_literal: true

# Tic, tac, toe game class that manages board state and player/cpu moves
class Game
  attr_reader :game_over

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @game_over = false
  end

  def draw_board
    @board.each_with_index do |row, idx|
      print_row(row)
      puts '---+---+---' unless idx == @board.length - 1
    end
  end

  def get_validated_input(user_input)
    number = string_to_number(user_input)
    number.between?(1, 3) ? number : nil
  end

  private

  def print_row(row)
    row.each_with_index do |token, idx|
      col_separator = idx == row.length - 1 ? "\n" : '|'
      print " #{token} #{col_separator}"
    end
  end

  def string_to_number(string)
    Integer(string || '')
  rescue ArgumentError
    -1
  end
end
