class BattleList
  
  attr_reader :order, :current_ap
  
  def initialize(roster)
    @turn = 0
    @order = initialize_order(roster)
    @current_ap = initialize_ap(roster)
  end
  
  def current_player
    @order[@turn]
  end
  
  def next_turn
    @turn += 1
    @current_ap.each do |name, ap|
      @current_ap[name] = ap + 1
    end
  end
  
  private
  
  def initialize_order(roster)
    order = []
    100.times do
      roster.movements.each do |name, moves|
        moves.times do 
          order << name
        end
      end
    end
    order.shuffle!
  end
  
  def initialize_ap(roster)
    starting_ap = {}
    roster.maximum_action_points.each do |name, max_ap|
      starting_ap[name] = max_ap.to_i/2
    end
    starting_ap
  end
  
end