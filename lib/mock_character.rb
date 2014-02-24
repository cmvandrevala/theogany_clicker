class MockCharacter
  
  Surrogate.endow(self)
  
  define(:initialize) do |params|
    @name = params[:name]
    @moves = params[:moves]
    @action_points = 7
    @status = :active
  end
  
  define(:has_died)             { @status = :dead }
  define(:has_been_knocked_out) { @status = :unconscious }
  define(:is_inactive)          { @status = :inactive }
  define(:is_active)            { @status = :active }
  define(:increase_ap)          { @action_points += 1 }
  define(:spend_ap) do |number|
    @action_points -= number
  end
  
  define_reader :name
  define_reader :moves
  define_reader :action_points
  define_reader :status
  
end