require 'surrogate/rspec'
require 'characters/mock_character'
require 'battles/battle_roster'
require 'battles/mock_battle_roster'

describe BattleRoster do
  
  before(:each) do
    @roster = BattleRoster.new
    @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 1}))
    @roster.add(MockCharacter.new({name: "Dockie Dockerson", moves: 2}))
    @roster.add(MockCharacter.new({name: "Rockie Rockerson", moves: 3}))
  end
  
  describe "mocking in surrogate" do
  
    it "implements the methods defined in MockCharacter" do
      MockBattleRoster.should be_substitutable_for(BattleRoster)
    end
  
  end
  
  describe "adding to the roster" do
    
    it "adds a single character" do
      new_roster = BattleRoster.new
      new_roster.add(MockCharacter.new)
      new_roster.character_names.should == ["Bob"]
    end
  
    it "does not add a duplicate character" do
      @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 1}))
      @roster.character_names.should == ["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"]
    end
    
    it "does not add a character with a duplicate name" do
      @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 5}))
      @roster.character_names.should == ["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"]
    end
    
    it "adds a character with a duplicate number of moves" do
      @roster.add(MockCharacter.new({name: "Sockie Sockerson", moves: 1}))
      @roster.character_names.should == ["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson", "Sockie Sockerson"]
    end
  
  end
  
  describe "calculating battle statistics" do
    
    context "movement probability" do
      
      it "displays a table of movement probabilities" do
        @roster.probability.should == { "Mockie Mockerson" => 1.0/6.0, "Dockie Dockerson" => 2.0/6.0, "Rockie Rockerson" => 3.0/6.0 }
      end
      
      it "displays the probability of a character moving" do
        @roster.probability("Mockie Mockerson").should == 1.0/6.0
      end
      
      it "displays the probability of a different character moving" do
        @roster.probability("Dockie Dockerson").should == 2.0/6.0
      end

      it "should not round to zero" do
        @roster.probability("Dockie Dockerson").should_not == 0.0  
      end
      
    end
  
  end
  
  describe "viewing tables of static character stats" do
    
    context "names" do
      
      it "gives a table of the character names" do
        @roster.character_names.should == ["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"]
      end
      
    end
    
    context "number of moves" do
      
      it "gives a table of the number of moves for each character" do
        @roster.movements.should == { "Mockie Mockerson" => 1, "Dockie Dockerson" => 2, "Rockie Rockerson" => 3 }
      end
      
      it "gives the number of moves for one character" do
        @roster.movements("Mockie Mockerson").should == 1
      end
      
    end
    
    context "maximum number of action points" do
      
      it "gives a table of the maximum number of action points of each character" do
        @roster.maximum_action_points.should == { "Mockie Mockerson" => 10, "Dockie Dockerson" => 10, "Rockie Rockerson" => 10 }
      end
      
      it "gives the number of action points for one character" do
        @roster.maximum_action_points("Mockie Mockerson").should == 10
      end
      
    end
    
    context "statuses" do
      
      it "gives a table of the statuses of each character" do
        @roster.statuses.should == { "Mockie Mockerson" => :active, "Dockie Dockerson" => :active, "Rockie Rockerson" => :active }
      end
      
      it "gives the status for one character" do
        @roster.statuses("Mockie Mockerson").should == :active
      end
      
    end
  
  end
  
end