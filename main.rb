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
    puts 'Current game board:'
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
  end
end
