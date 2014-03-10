require 'surrogate/rspec'
require 'mock_character'
require 'character'

describe Character do
  
  before(:each) do
    @character = Character.new({name: "Pookie Pookerson", moves: 1})
  end
  
  describe "mocking in surrogate" do
  
    it "implements the methods defined in MockCharacter" do
      MockCharacter.should be_substitutable_for(Character)
    end
  
  end
  
  describe "initialization" do
  
    it "creates a character with a name" do
      @character.name.should == "Pookie Pookerson"
    end
  
    it "creates a character with a set number of moves" do
      @character.moves.should == 1
    end
    
    it "creates a character with a default 'active' status" do
      @character.status.should == :active
    end
    
    it "creates a character with seven default action points" do
      @character.action_points.should == 7
    end
  
  end
  
  describe "the number of action points" do
    
    it "can increase by one" do
      @character.increase_ap
      @character.action_points.should == 8
    end
    
    it "cannot exceed 10" do
      20.times { @character.increase_ap }
      @character.action_points.should == 10
    end
    
    it "can be spent on an action" do
      @character.spend_ap(5)
      @character.action_points.should == 2
    end
    
    it "can be spent down to zero minimum" do
      @character.spend_ap(7)
      @character.action_points.should == 0
    end
    
    it "raises an exception if you try to spend too many" do
      expect { @character.spend_ap(100) }.to raise_error
    end
  
  end
  
  describe "character status" do
    
    it "can be changed to dead" do
      @character.has_died
      @character.status.should == :dead
    end
    
    it "can be changed to unconscious" do
      @character.has_been_knocked_out
      @character.status.should == :unconscious
    end
    
    it "can be changed to inactive" do
      @character.is_inactive
      @character.status.should == :inactive
    end
    
    it "can be changed to active" do
      @character.is_inactive
      @character.is_active
      @character.status.should == :active
    end
    
  end
    
end

