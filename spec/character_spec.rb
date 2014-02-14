require 'surrogate/rspec'
require 'mock_character'
require 'character'

describe Character do
  
  before(:each) do
    @character = Character.new({name: "Pookie Pookerson", action_points: 1})
  end
  
  it "implements the methods defined in MockCharacter" do
    MockCharacter.should be_substitutable_for(Character)
  end
  
  it "has a name" do
    @character.name.should == "Pookie Pookerson"
  end
  
  it "name can be updated" do
    @character.name = "Bookie Bookerson"
    @character.name.should == "Bookie Bookerson"
  end
  
  it "has a number of action points" do
    @character.action_points.should == 1
  end
    
end