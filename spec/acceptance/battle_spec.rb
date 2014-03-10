require 'character'
require 'battle_roster'
require 'battle_list'

describe "A Battle" do

  before(:each) do
    @roster = BattleRoster.new
    @roster.add(Character.new({name: "Mockie Mockerson", moves: 1}))
    @roster.add(Character.new({name: "Dockie Dockerson", moves: 2}))
    @roster.add(Character.new({name: "Rockie Rockerson", moves: 3}))
    @battle_list = BattleList.new(@roster)
  end

  it "returns the maximum number of action points if nothing happens" do
    @battle_list.order.length.times { @roster.next_move }
    @roster.action_points.should == {"Mockie Mockerson" => 10, "Dockie Dockerson" => 10, "Rockie Rockerson" => 10}
  end

  it "correctly goes through one turn of a battle with one action" do
    points_to_spend = 5
    @roster.next_move
    @roster.take_action("Mockie Mockerson", points_to_spend)
    (@battle_list.order.length - 1).times { @roster.next_move }
    @roster.action_points.should == {"Mockie Mockerson" => 8, "Dockie Dockerson" => 10, "Rockie Rockerson" => 10}
  end

end