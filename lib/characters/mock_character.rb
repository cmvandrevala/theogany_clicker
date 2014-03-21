class MockCharacter
  
  Surrogate.endow(self)
  
  define(:initialize) do |params = {}|
    @name = params[:name] || "Bob"
    @moves = params[:moves] || 2
    @wounds = params[:wounds] || 3
    @status = params[:status] || :active
    @action_points = params[:action_points] || 10
  end
  
  define(:has_died)             { @status = :dead }
  define(:has_been_knocked_out) { @status = :unconscious }
  define(:is_inactive)          { @status = :inactive }
  define(:is_active)            { @status = :active }
  
  define_reader :name
  define_reader :moves
  define_reader :status
  define_reader :wounds
  define_reader :action_points
  
end