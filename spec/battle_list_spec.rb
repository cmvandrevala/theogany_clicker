require 'surrogate/rspec'
require 'mock_character'
require 'battle_roster'
require 'battle_list'

describe BattleList do
  
  before(:each) do
    @roster = BattleRoster.new
    @character_one = MockCharacter.new({name: "Mockie Mockerson", moves: 1})
    @character_two = MockCharacter.new({name: "Dockie Dockerson", moves: 2})
    @character_three = MockCharacter.new({name: "Rockie Rockerson", moves: 3})
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @battle_list = BattleList.new(@roster)
  end
  
  it "creates a battle list from a roster" do
    @battle_list.order.should be_an_instance_of Array
  end
  
  it "includes only the roster characters in the order" do
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
  
  xit "should be randomized" do
  end
  
end