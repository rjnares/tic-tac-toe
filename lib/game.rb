# frozen_string_literal: true

require_relative 'game_io'

# Tic, tac, toe game class that manages board state and player/cpu moves
class Game
  include GameIO

  PLAYER_TOKEN = 'X'
  CPU_TOKEN = 'O'
  EMPTY_TOKEN = ' '

  def initialize
    @board = Array.new(3) { Array.new(3, EMPTY_TOKEN) }
  end

  def play
    welcome_message
    return exit_message if game_start_options == 1

    new_game_message
    play_turns
  end

  private

  attr_reader :board

  def play_turns
    loop do
      move = player_move
      make_move(move.first, move.last, PLAYER_TOKEN)
      return player_win_message(PLAYER_TOKEN) if winning_move?(move.first - 1, move.last - 1, PLAYER_TOKEN)
      return all_spaces_filled_message if no_available_spaces?

      move = cpu_move
      make_move(move.first, move.last, CPU_TOKEN)
      return player_lose_message(CPU_TOKEN) if winning_move?(move.first - 1, move.last - 1, CPU_TOKEN)
      return all_spaces_filled_message if no_available_spaces?
    end
  end

  def make_move(row, col, token)
    board[row - 1][col - 1] = token
    move_set_message(row, col, token)
  end

  def winning_move?(row_idx, col_idx, token)
    three_in_a_row?(row_idx, token) || three_in_a_column?(col_idx, token) || three_diagonal?(token)
  end

  def three_in_a_row?(row_idx, token)
    board[row_idx].all?(token)
  end

  def three_in_a_column?(col_idx, token)
    board.all? { |row| row[col_idx] == token }
  end

  def three_diagonal?(token)
    board.each_with_index.all? { |row, row_idx| row[row_idx] == token } ||
      board.reverse.each_with_index.all? { |row, row_idx| row[row_idx] == token }
  end

  def cpu_move
    available_spaces = []

    board.each_with_index do |row, row_idx|
      row.each_with_index do |token, col_idx|
        available_spaces << [row_idx + 1, col_idx + 1] if token == EMPTY_TOKEN
      end
    end

    available_spaces.sample
  end

  def no_available_spaces?
    board.flatten.count(EMPTY_TOKEN).zero?
  end
end
