# frozen_string_literal: true

require_relative 'lib/game'

quit_game = false

puts 'Welcome to my tic, tac, toe game built with Ruby!'

until quit_game
  puts
  puts "  > Enter '1' to exit the program"
  puts "  > Enter '2' to start a new game"
  puts
  print 'Your input: '
  user_input = gets.chomp
  puts

  if user_input == '1'
    puts 'Exiting the program...'
    quit_game = true
    next
  end

  unless user_input == '2'
    puts 'Invalid input, please try again...'
    next
  end

  puts 'Starting a new game...'
  game = Game.new

  until game.game_over
    puts
    puts 'Current game board'
    game.draw_board

    puts
    puts 'Please enter your next move...'
    puts
    puts '  > Enter a row integer between 1 and 3'
    puts
    print 'Your input: '
    row = game.get_validated_input(gets.chomp)
    puts

    unless row
      puts 'Row integer is invalid, please try again...'
      next
    end

    puts '  > Enter a column integer between 1 and 3'
    puts
    print 'Your input: '
    column = game.get_validated_input(gets.chomp)
    puts

    unless column
      puts 'Column integer is invalid, please try again...'
      next
    end

    unless game.valid_move?(row, column)
      puts "Space [#{row}, #{column}] is already filled, please try again..."
      next
    end

    game.make_player_move(row, column)
    puts "You placed an 'X' on space [#{row}, #{column}]"

    if game.winner == 'X'
      game.draw_board
      puts
      puts 'Game Over!'
      puts "That is three 'X' in a row...you win!"
      next
    elsif game.game_over
      game.draw_board
      puts
      puts 'Game Over!'
      puts 'All spaces have been filled...game ends in a tie!'
      next
    end

    row, column = game.generate_cpu_move
    game.make_cpu_move(row, column)
    puts "The cpu placed an 'O' on space [#{row}, #{column}]"

    if game.winner == 'O'
      game.draw_board
      puts
      puts 'Game Over!'
      puts "That is three 'O' in a row...you lose!"
    elsif game.game_over
      game.draw_board
      puts
      puts 'Game Over!'
      puts 'All spaces have been filled...game ends in a tie!'
    end
  end
end
