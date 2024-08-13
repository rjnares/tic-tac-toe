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
      input = string_to_number(gets.chomp)
      return input if valid_input?(input, 1, 2)

      invalid_input_message
    end
  end

  def player_move
    loop do
      draw_board
      row = player_row
      col = player_col
      return [row, col] if valid_move?(row - 1, col - 1)

      invalid_move_message(row, col)
    end
  end

  def valid_move?(row, col)
    board[row][col] == ' '
  end

  def invalid_move_message(row, col)
    puts <<~HEREDOC

      Space [#{row}, #{col}] is already filled...
    HEREDOC
  end

  def player_row
    loop do
      row_input_message
      input = string_to_number(gets.chomp)
      return input if valid_input?(input, 1, 3)

      invalid_input_message
      draw_board
    end
  end

  def player_col
    loop do
      col_input_message
      input = string_to_number(gets.chomp)
      return input if valid_input?(input, 1, 3)

      invalid_input_message
      draw_board
    end
  end

  def valid_input?(input, min, max)
    return valid_input?(input, max, min) if max < min

    input.between?(min, max)
  end

  def game_start_prompt
    puts <<-HEREDOC

    > Enter '1' to exit the game
    > Enter '2' to start a new game

    HEREDOC
    print 'Your input: '
  end

  def draw_board
    puts <<-HEREDOC

   1   2   3
    HEREDOC
    board.each_with_index { |row, idx| print_row(row, idx + 1) }
  end

  def print_row(row, row_num)
    print "#{row_num} "

    row.each_with_index do |token, idx|
      col_separator = idx == row.length - 1 ? "\n" : '|'
      print " #{token} #{col_separator}"
    end

    puts '  ---+---+---' unless row_num == board.length
  end

  def col_input_message
    puts <<~HEREDOC

      Enter a column integer between '1' and '3'

    HEREDOC
    print 'Your input: '
  end

  def string_to_number(string)
    Integer(string || '')
  rescue ArgumentError
    -1
  end

  def row_input_message
    puts <<~HEREDOC

      Enter a row integer between '1' and '3'

    HEREDOC
    print 'Your input: '
  end
end
