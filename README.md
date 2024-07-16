# Tic, Tac, Toe

This is my implementation of the [Tic, Tac, Toe](https://www.theodinproject.com/lessons/ruby-tic-tac-toe) project assigned in the [OOP Basics](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#object-oriented-programming-basics) section of the [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from the [The Odin Project](https://www.theodinproject.com).

## Project Description

This simple Ruby application is a tic, tac, toe game which is played by running `ruby main.rb` in the console. The game itself consists of turns between the player `X's` and cpu `O's`. The game board is drawn on the console every turn to give the user an updated view of the game state before making their next move. The player makes their move by entering a row and a column on the console, both of which are integers between 1 and 3. If a win condition is met, either by connecting three `X's` or `O's`, then the game will end and the player or cpu will be declared as the winner. If the number of available spaces reaches zero before a win condition is met, then the game will end and a tie will be declared.

## Skills Applied

The goal of this project was to apply everything learned in the [OOP Basics](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#object-oriented-programming-basics) section of the [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby). There are many ways in which these concepts could be applied on a practical project such as this, but my implementation specifically applied the following:
* Creating a `Game` class
* Creating instance variables and methods in the `Game` class
* Creating "getters" for instance variables via `attr_reader`
* Implementing `Method Access Control` via `private` methods only used by instance methods in the `Game` class
