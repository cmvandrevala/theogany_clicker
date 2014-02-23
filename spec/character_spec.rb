require 'surrogate/rspec'
require 'mock_character'
require 'character'

describe Character do
  
  before(:each) do
    @character = Character.new({name: "Pookie Pookerson", moves: 1})
  end
  
  it "implements the methods defined in MockCharacter" do
    MockCharacter.should be_substitutable_for(Character)
  end
  
  describe "initialization" do
  
    it "creates a name" do
      @character.name.should == "Pookie Pookerson"
    end
  
    it "creates a number of moves" do
      @character.moves.should == 1
    end
  
  end
  
  describe "action points" do
  
    it "has a default starting number" do
      @character.action_points.should == 7
    end
    
    it "can increase by one" do
      @character.increase
      @character.action_points.should == 8
    end
    
    it "cannot exceed 10" do
      20.times { @character.increase }
      @character.action_points.should == 10
    end
    
    it "can be spent" do
      @character.spend(5)
      @character.action_points.should == 2
    end
    
    it "cannot be lower than zero" do
      @character.spend(100)
      @character.action_points.should == 7
    end
  
  end
  
  describe "status" do
    
    it "has a default status" do
      @character.status.should == :active
    end
    
    it "can be changed to dead" do
      @character.has_died
      @character.status.should == :dead
    end
    
    it "can be changed to skip" do
      @character.skip_turns
      @character.status.should == :skip
    end
    
  end
    
end