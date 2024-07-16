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
  elsif user_input == '2'
    puts 'Exiting the program...'
    quit_game = true
  else
    puts 'Unrecognized input, please try again...'
  end
end