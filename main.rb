run_game = true

puts 'Tic Tac Toe'

while run_game
  puts '  > Enter 1 to start a new game'
  puts '  > Enter 2 to exit'

  print 'Input: '

  user_choice = gets.chomp

  if user_choice == '1'
    puts 'Starting a new game...'
  elsif user_choice == '2'
    puts 'Exiting...'
    run_game = false
  else
    puts 'Unrecognized input...'
  end
end