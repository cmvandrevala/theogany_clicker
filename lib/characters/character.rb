class Character
  
  attr_reader :name, :moves, :status, :wounds
  attr_reader :action_points
  
  def initialize(parameters)
    parameters = defaults.merge(parameters)
    @name = parameters[:name]
    @moves = parameters[:moves]
    @status = parameters[:status]
    @wounds = parameters[:wounds]
    @action_points = parameters[:action_points]
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
  
  def defaults
    { :moves => 2, :status => :active, :action_points => 10, :wounds => 3 }
  end
  
end