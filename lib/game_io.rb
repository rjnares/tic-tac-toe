# frozen_string_literal: true

# Module for game input/output
module GameIO
  def welcome_message
    puts <<~HEREDOC

      Welcome to my tic, tac, toe game built with Ruby!
    HEREDOC
  end

  def invalid_input_message
    puts <<~HEREDOC

      Invalid input, please try again...
    HEREDOC
  end

  def exit_message
    puts <<~HEREDOC

      Exiting the game...
    HEREDOC
  end

  def new_game_message
    puts <<~HEREDOC

      Starting a new game...
    HEREDOC
  end

  def game_start_options
    loop do
      game_start_prompt
      input = gets.chomp
      return input if valid_input?(input)

      invalid_input_message
    end
  end

  def valid_input?(input)
    %w[1 2].include?(input)
  end

  def game_start_prompt
    puts <<-HEREDOC

    > Enter '1' to exit the game
    > Enter '2' to start a new game

    HEREDOC
    print 'Your input: '
  end
end
