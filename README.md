# Tic, Tac, Toe

This is my implementation of the [Tic, Tac, Toe](https://www.theodinproject.com/lessons/ruby-tic-tac-toe) project assigned in the [OOP Basics](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#object-oriented-programming-basics) section of the [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from the [The Odin Project](https://www.theodinproject.com).

## Project Description

This simple Ruby application is a tic, tac, toe game which is played by running `bundle exec ruby main.rb` in the console. The game itself consists of turns between the Player `X's` and CPU `O's`. The game board is printed on the console every turn to give the Player an updated view of the game state before making their next move. The Player makes their move by entering a row and column on the console, both of which are integers between 1 and 3. If a win condition is met, either by connecting three `X's` or `O's`, then the game will end and the Player or CPU will be declared the winner. If the number of available spaces reaches zero before a win condition is met, then the game will end and a tie will be declared.

## Skills Applied

The original goal of this project was to apply everything learned in the [OOP Basics](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#object-oriented-programming-basics) section of the [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby). However, this project was revisited in a later section of the curriculum in order to add unit tests and refactor the code by applying Test-Driven Development principles. Having learned a lot since my first iteration of this project, I decided to refactor the entire project and add unit tests where applicable. This resulted in the following changes:
* Creating a `GameIO` module with helper methods for all the repeated input/output work that was originally in the `main.rb` script 
* Refactoring the `Game` class to be the driver of the game play instead of the `main.rb` script
* Refactoring the `Game` class to use helper methods from the `GameIO` module to accomplish its tasks
* Creating unit tests for the `Game` class and `GameIO` module in `spec/game_spec.rb`
