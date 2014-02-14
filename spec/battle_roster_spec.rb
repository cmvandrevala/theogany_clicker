require 'surrogate/rspec'
require 'mock_character'
require 'battle_roster'

describe BattleRoster do
  
  before(:each) do
    @roster = BattleRoster.new
    @character_one = MockCharacter.new
    @character_two = MockCharacter.new
    @character_three = MockCharacter.new
  end
  
  it "adds a character" do
    @character_one.name = "Mockie Mockerson"
    @roster.add(@character_one)
    @roster.list_characters.should == ["Mockie Mockerson"]
  end
  
  it "adds another character" do
    @character_one.name = "Mockie Mockerson"
    @character_two.name = "Happy Happerson"
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.list_characters.should == ["Mockie Mockerson", "Happy Happerson"]
  end
  
  it "does not add a character with a duplicate name" do
    @character_one.name = "one"
    @character_two.name = "one"
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.list_characters.should == ["one"]
  end
  
  it "displays the probability of choosing a character among two" do
    @character_one.name = "one"
    @character_two.name = "two"
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.probability(@character_one).should == 1/2
  end
  
  it "displays the probability of choosing a character among three" do
    @character_one.name = "one"
    @character_two.name = "two"
    @character_three.name = "three"
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @roster.probability(@character_one).should == 1/3
  end
  
end