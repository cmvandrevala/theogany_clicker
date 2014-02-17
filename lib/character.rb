class Character
  
  attr_reader :name, :moves, :action_points, :status
  
  def initialize(character_params)
    @name = character_params[:name]
    @moves = character_params[:moves]
    @action_points = 7
    @status = :active
  end
  
  def has_died
    @status = :dead
  end
  
  def skip_turns
    @status = :skip
  end
  
  def increase
    @action_points += 1 if @action_points < 10
  end
  
  def spend(number_of_points)
    new_value = @action_points - number_of_points
    @action_points = new_value if new_value > 0
  end
  
end