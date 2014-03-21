require 'surrogate/rspec'
require 'characters/mock_character'
require 'battles/mock_battle_roster'
require 'battles/battle_list'

describe BattleList do
  
  before(:each) do
    @roster = MockBattleRoster.new
    @battle_list = BattleList.new(@roster)
  end
  
  it "includes the roster characters in the order" do
    @battle_list.order.each do |character|
      flag = false
      flag = true if character == "Bob"
      flag = true if character == "Sam"
      flag = true if character == "Chris"
      flag.should == true
    end
  end
  
  it "has a total length equal to the total number of moves" do
    @battle_list.order.length.should == 6
  end
  
end