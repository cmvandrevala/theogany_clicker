class MockCharacter
  Surrogate.endow(self)
  define_accessor :name
  define(:action_points) { 1 }
end