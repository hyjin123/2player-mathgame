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