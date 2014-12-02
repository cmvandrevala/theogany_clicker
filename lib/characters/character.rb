class Character

  attr_reader :name, :moves, :action_points

  def initialize(parameters)
    parameters = defaults.merge(parameters)
    @name = parameters[:name]
    @moves = parameters[:moves]
    @wounds = parameters[:wounds]
    @action_points = parameters[:action_points]
  end

  private

  def defaults
    { :moves => 2, :action_points => 10 }
  end

end