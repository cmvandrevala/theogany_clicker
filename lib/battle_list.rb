class BattleList
  
  attr_reader :order
  
  def initialize(roster)
    @order = []
    roster.movements.each do |name, moves|
      moves.times do 
        @order << name
      end
    end
    @order.shuffle!
  end
  
end