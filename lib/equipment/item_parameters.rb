class ItemParameters
  
  attr_accessor :name, :type, :weight
  attr_accessor :description
  
  def initialize(parameters)
    parameters = defaults.merge(parameters)
    @name = parameters[:name]
    @type = parameters[:type]
    @weight = parameters[:weight]
    @description = parameters[:description]
  end
  
  private
  
  def defaults
    { description: nil }
  end
  
end