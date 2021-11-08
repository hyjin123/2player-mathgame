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

class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @current_score = 3
  end

  # method to get the player's score
  def current_score
    @current_score
  end

  # method to reduce life if player is incorrect
  def reduce_current_score
    @current_score -= 1
  end

end

class Question
  
  attr_reader :number1, :number2

  def initialize(player_name)
    @number1 = rand(1..10)
    @number2 = rand(1..10)
    @player_name = player_name
  end

  def question
    puts "#{@player_name}: What does #{self.number1} plus #{self.number2} equal?"
    @player_answer = gets.chomp
  end

  def answer
    @correct_answer = @number1 + @number2
  end

end

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

newGame = Game.new
puts newGame.start_the_game