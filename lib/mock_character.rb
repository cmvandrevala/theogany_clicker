class MockCharacter
  
  Surrogate.endow(self)
  
  define(:initialize) do |params|
    @name = params[:name]
    @action_points = params[:action_points]
  end
  
  define_reader :name
  define_reader :action_points
  
end