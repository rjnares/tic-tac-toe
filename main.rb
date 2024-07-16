# frozen_string_literal: true

require_relative 'lib/game'

quit_game = false

puts 'Welcome to my tic, tac, toe game built with Ruby!'

until quit_game
  puts
  puts "  > Enter '1' to start a new game"
  puts "  > Enter '2' to exit the program"
  puts
  print 'Your input: '
  user_input = gets.chomp
  puts

  if user_input == '1'
    puts 'Starting a new game...'
    game = Game.new

    until game.game_over
      puts
      puts 'Current game board:'
      game.draw_board

      puts
      puts 'Please enter your next move...'
      puts
      puts '  > Enter a row number between 1 and 3'
      puts
      print 'Your input: '
      row = game.get_validated_input(gets.chomp)
      puts

      unless row
        puts 'Row number is invalid, please try again...'
        next
      end

      puts '  > Enter a column number between 1 and 3'
      puts
      print 'Your input: '
      column = game.get_validated_input(gets.chomp)
      puts

      unless column
        puts 'Column number is invalid, please try again...'
        next
      end
    end
  elsif user_input == '2'
    puts 'Exiting the program...'
    quit_game = true
  else
    puts 'Invalid input, please try again...'
  end
end
