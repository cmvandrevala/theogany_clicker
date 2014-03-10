class Character
  
  attr_reader :name, :moves, :action_points, :status
  
  def initialize(character_params)
    @name = character_params[:name]
    @moves = character_params[:moves]
    @action_points = 7
    @status = :active
  end
  
  def increase_ap
    @action_points += 1 if @action_points < 10
  end
  
  def spend_ap(number_of_points)
    raise "You spent too many points!" if number_of_points > @action_points
    @action_points = new_ap(number_of_points) if new_ap(number_of_points) >= 0
  end
  
  def has_died
    @status = :dead
  end
  
  def has_been_knocked_out
    @status = :unconscious
  end
  
  def is_inactive
    @status = :inactive
  end
  
  def is_active
    @status = :active
  end
  
  private
  
  def new_ap(number_of_points)
    @action_points - number_of_points
  end
  
end