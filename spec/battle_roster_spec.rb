require 'surrogate/rspec'
require 'mock_character'
require 'battle_roster'

describe BattleRoster do
  
  before(:each) do
    @roster = BattleRoster.new
    @character_one = MockCharacter.new({name: "Mockie Mockerson", moves: 1})
    @character_two = MockCharacter.new({name: "Dockie Dockerson", moves: 2})
    @character_three = MockCharacter.new({name: "Rockie Rockerson", moves: 3})
  end
  
  it "adds a character" do
    @roster.add(@character_one)
    @roster.list_characters.should == ["Mockie Mockerson"]
  end
  
  it "adds two characters" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.list_characters.should == ["Mockie Mockerson", "Dockie Dockerson"]
  end
  
  it "adds three characters" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @roster.list_characters.should == ["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"]
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
  end
  
  it "displays the probability of choosing a character among many" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @roster.probability(@character_two).should == 1.0/3.0
  end
  
  it "probability should not round to zero" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @roster.probability(@character_two).should_not == 0.0  
  end
  
  it "gives a table of the number of moves with each character" do
    @roster.add(@character_one)
    @roster.add(@character_two)
    @roster.add(@character_three)
    @roster.movements.should == { "Mockie Mockerson" => 1, "Dockie Dockerson" => 2, "Rockie Rockerson" => 3 }
  end
  
end