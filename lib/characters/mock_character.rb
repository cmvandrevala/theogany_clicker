class MockCharacter

  Surrogate.endow(self)

  define(:initialize) do |params = {}|
    @name = params[:name] || "Bob"
    @moves = params[:moves] || 2
    @action_points = params[:action_points] || 10
  end

  define_reader :name
  define_reader :moves
  define_reader :action_points

end