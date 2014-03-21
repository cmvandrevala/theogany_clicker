class MockBattleRoster
  
  Surrogate.endow(self)
  
  define(:add) do |params|
  end
  
  define(:movements) do |params = nil|
    {"Bob" => 1, "Sam" => 2, "Chris" => 3}
  end
  
  define(:probability) do |params = nil|
  end
  
  define(:character_names) do
    
  end
  
  define(:statuses) do |params = nil|
  end
      
  define(:maximum_action_points) do |params = nil|
  end
  
end