# class Player - keeps track of the player's scores, function to reduce life
# could have name ex Player 1, Player 2
# Player1 - Instance of Player class - lives
# Player2 - Instance of Player class - lives

# class Question - creates a new math question and outputs question
# whenever this is called, creates a new question and the answer

# class Game - keeps the status of the game - on or off
# it will include current player - as long as live is not finished, it will
# switch player (method to switch player)
# method to get the question, check the answer
# method to check if player is dead


# Game class will call question. will also call player class to reduce lives

require './player'
require './question'
require './game'

newGame = Game.new
puts newGame.start_the_game