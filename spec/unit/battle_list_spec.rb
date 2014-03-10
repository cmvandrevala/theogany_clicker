require 'surrogate/rspec'
require 'mock_character'
require 'battle_roster'
require 'battle_list'

describe BattleList do
  
  before(:each) do
    @roster = BattleRoster.new
    @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 1}))
    @roster.add(MockCharacter.new({name: "Dockie Dockerson", moves: 2}))
    @roster.add(MockCharacter.new({name: "Rockie Rockerson", moves: 3}))
    @battle_list = BattleList.new(@roster)
  end
  
  it "includes the roster characters in the order" do
    @battle_list.order.each do |character|
      flag = false
      flag = true if character == "Mockie Mockerson"
      flag = true if character == "Rockie Rockerson"
      flag = true if character == "Dockie Dockerson"
      flag.should == true
    end
  end
  
  it "has a total length equal to the total number of moves" do
    @battle_list.order.length.should == 6
  end
  
end