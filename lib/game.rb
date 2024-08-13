# frozen_string_literal: true

require_relative 'game_io'

# Tic, tac, toe game class that manages board state and player/cpu moves
class Game
  include GameIO

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def play
    welcome_message
    return exit_message if game_start_options == '1'

    new_game_message
    play_turns
  end

  def play_turns
    puts <<~HEREDOC

      TODO
    HEREDOC
  end
end
