# frozen_string_literal: true

# Tic, tac, toe game class that manages board state and player/cpu moves
class Game
  attr_reader :game_over

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @game_over = false
  end

  def draw_board
    puts '   1   2   3'
    @board.each_with_index do |row, idx|
      print_row(row, idx + 1)
    end
  end

  def get_validated_input(user_input)
    number = string_to_number(user_input)
    number.between?(1, 3) ? number : nil
  end

  def valid_move?(row, column)
    @board[row - 1][column - 1] == ' '
  end

  def make_player_move(row, column)
    make_move(row - 1, column - 1, 'X')
  end

  private

  def make_move(row_index, column_index, token)
    @board[row_index][column_index] = token
    @game_over = true if last_move_wins?(row_index, column_index, token)
  end

  def last_move_wins?(row_index, column_index, token)
    three_in_a_row?(row_index, token) ||
      three_in_a_column?(column_index, token) ||
      three_diagonal?(token)
  end

  def three_in_a_row?(row_index, token)
    @board[row_index].all? { |element| element == token }
  end

  def three_in_a_column?(column_index, token)
    @board.map { |row| row[column_index] }.all? { |element| element == token }
  end

  def three_diagonal?(token)
    top_left_to_bottom_right = @board.each_with_index.map { |row, row_index| row[row_index] }
    bottom_left_to_top_right = @board.reverse.each_with_index.map { |row, row_index| row[row_index] }
    top_left_to_bottom_right.all? { |element| element == token } ||
      bottom_left_to_top_right.all? { |element| element == token }
  end

  def print_row(row, row_num)
    print "#{row_num} "
    row.each_with_index do |token, idx|
      col_separator = idx == row.length - 1 ? "\n" : '|'
      print " #{token} #{col_separator}"
    end
    puts '  ---+---+---' unless row_num == @board.length
  end

  def string_to_number(string)
    Integer(string || '')
  rescue ArgumentError
    -1
  end
end
