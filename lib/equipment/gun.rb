require 'equipment/item_parameters'

class Gun < ItemParameters
  
  attr_reader :features
  
  def initialize(parameters)
    parameters = defaults.merge(parameters)
    @base_shots = parameters[:base_shots]
    @base_range = parameters[:base_range]
    @features = {}
    super
  end
  
  def weight
    @weight + adjustments(:weight)
  end
  
  def range
    @base_range + adjustments(:range)
  end
  
  def shots
    @base_shots + adjustments(:shots)
  end
  
  def add_feature(new_features)
    new_features.each do |name, effects|
      effects = effects.each_slice(2).to_a
      effects.each do |effect|
        @features[name] = effect
      end
    end
  end
  
  private
  
  def defaults
    { base_shots: 6, base_range: 10 }
  end
  
  def adjustments(attribute)
    adjustment = 0
    @features.each do |name, effect|
      adjustment += effect[1] if effect[0] == attribute
    end
    adjustment
  end
  
end