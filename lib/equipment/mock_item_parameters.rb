class MockItemParameters
  
  Surrogate.endow(self)
  
  define(:initialize) do
    @name = "Bob"
    @type = :machine_gun
    @weight = 2
    @description = nil
  end
  
  define_accessor :name
  define_accessor :type
  define_accessor :weight
  define_accessor :description
  
end