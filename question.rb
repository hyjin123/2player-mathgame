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