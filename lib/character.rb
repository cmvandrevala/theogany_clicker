class Character
  
  attr_reader :name, :action_points
  
  def initialize(character_params)
    @name = character_params[:name]
    @action_points = character_params[:action_points]
  end
  
end