require 'equipment/item_parameters'

class Gun < ItemParameters
  
  attr_reader :shots
  
  def initialize(parameters)
    parameters = defaults.merge(parameters)
    @base_shots = parameters[:base_shots]
    @base_range = parameters[:base_range]
    super
  end
  
  def range
    @base_range
  end
  
  def shots
    @base_shots
  end
  
  private
  
  def defaults
    { base_shots: 6, base_range: 10 }
  end
  
end