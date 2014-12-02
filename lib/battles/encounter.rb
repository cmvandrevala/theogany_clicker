class Encounter

  attr_reader :order, :current_action_points

  def initialize(roster)
    @turn = 0
    @roster = roster
    @order = initialize_order
    @current_action_points = initialize_action_points
  end

  def current_player
    @order[@turn]
  end

  def current_ap
    @current_action_points[current_player]
  end

  def spend_ap(number_of_action_points)
    @current_action_points[current_player] -= number_of_action_points
  end

  def next_turn
    @turn += 1
    @current_action_points.each do |name, ap|
      @current_action_points[name] = ap + 1 if ap < 10
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
    @roster.table(:moves).each do |name, moves|
      moves.times do
        movements_for_round << name
      end
    end
    movements_for_round.shuffle!
  end

  def initialize_action_points
    starting_ap = {}
    @roster.table(:action_points).each do |name, max_ap|
      starting_ap[name] = max_ap.to_i/2
    end
    starting_ap
  end

end