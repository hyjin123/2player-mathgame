require './player'
require './question'

class Game

  attr_accessor :player1

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players = [@player1, @player2]
    @current_player_index = 0
  end
 
  def current_player
    @players[@current_player_index]
  end

  # switches the current_player_index
  def next_player
    @current_player_index = (@current_player_index + 1) % @players.length
  end

  # the game loop
  def start_the_game    
    while @player1.current_score != 0 && @player2.current_score != 0 
      # create a new question
      new_question = Question.new(current_player.name)
      # save the player answer
      player_answer = new_question.question
      # save the correct answer
      correct_answer = new_question.answer
      if player_answer.to_i == correct_answer.to_i
        puts "#{current_player.name}: YES! you are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        # reduce the score when the current player gets it wrong
        current_player.reduce_current_score
      end
      # show the current status
      current_status
      # switch the player for the next turn
      next_player
    end
    # end of the game
    final_status
  end

  # outputs current score
  def current_status
    puts "P1: #{@players[0].current_score}/3 vs P2: #{@players[1].current_score}/3"
    puts "----- NEW TURN -----"
  end

  # method to output the final game score
  def final_status
    if @player1.current_score > 0
      puts "#{@player1.name} wins with a score of #{@player1.current_score}/3"
      puts "----- GAME OVER -----"
    elsif @player2.current_score > 0
      puts "#{@player2.name} wins with a score of #{@player2.current_score}/3"
      puts "----- GAME OVER -----"
    end
  end

end