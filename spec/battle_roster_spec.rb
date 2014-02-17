require 'surrogate/rspec'
require 'mock_character'
require 'battle_roster'

describe BattleRoster do
  
  before(:each) do
    @roster = BattleRoster.new
    @character_one = MockCharacter.new({name: "Mockie Mockerson", action_points: 1})
    @character_two = MockCharacter.new({name: "Dockie Dockerson", action_points: 2})
    @character_three = MockCharacter.new({name: "Rockie Rockerson", action_points: 3})
  end
  
  it "adds a character" do
    @roster.add(@character_one)
    @roster.list_characters.should == ["Mockie Mockerson"]
  end
  
  it "adds another character" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.list_characters.should == ["Mockie Mockerson", "Dockie Dockerson"]
  end
  
  it "does not add a character with a duplicate name" do
    @roster.add(@character_one)
    @roster.add(@character_one)
    @roster.list_characters.should == ["Mockie Mockerson"]
  end
  
  it "displays the probability of choosing a character among two" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.probability(@character_one).should == 1.0/3.0
    @roster.probability(@character_one).should_not == 0.0
  end
  
  it "displays the probability of choosing a character among three" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @roster.probability(@character_two).should == 1.0/3.0
    @roster.probability(@character_two).should_not == 0.0
  end
  
end