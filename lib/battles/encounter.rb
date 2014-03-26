class Encounter
  
  attr_reader :order, :current_aps
  
  def initialize(roster)
    @turn = 0
    @roster = roster
    @order = initialize_order
    @current_aps = initialize_ap
  end
  
  def current_player
    @order[@turn]
  end
  
  def current_ap
    @current_aps[current_player]
  end
  
  def spend_ap(number_of_action_points)
    @current_aps[current_player] -= number_of_action_points
  end
  
  def next_turn
    @turn += 1
    @current_aps.each do |name, ap|
      @current_aps[name] = ap + 1 if ap < 10
    end
  end
  
  private
  
  def initialize_order
    order = []
    100.times do
      order.concat movements_for_a_round
    end
    order
  end
  
  def movements_for_a_round
    movements_for_round = []
    @roster.movements.each do |name, moves|
      moves.times do 
        movements_for_round << name
      end
    end
    movements_for_round.shuffle!
  end
  
  def initialize_ap
    starting_ap = {}
    @roster.maximum_action_points.each do |name, max_ap|
      starting_ap[name] = max_ap.to_i/2
    end
    starting_ap
  end
  
end