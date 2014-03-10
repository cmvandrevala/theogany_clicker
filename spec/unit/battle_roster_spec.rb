require 'surrogate/rspec'
require 'mock_character'
require 'battle_roster'

describe BattleRoster do
  
  before(:each) do
    @roster = BattleRoster.new
    @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 1}))
    @roster.add(MockCharacter.new({name: "Dockie Dockerson", moves: 2}))
    @roster.add(MockCharacter.new({name: "Rockie Rockerson", moves: 3}))
  end
  
  describe "adding to the roster" do
    
    it "adds a single character" do
      new_roster = BattleRoster.new
      new_roster.add(MockCharacter.new({name: "Sockie Sockerson", moves: 4}))
      new_roster.character_names.should == ["Sockie Sockerson"]
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
  
  describe "battle statistics" do
    
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
  
  describe "viewing tables of character stats" do
    
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
    
    context "action points" do
      
      it "gives a table of the action points of each character" do
        @roster.action_points.should == { "Mockie Mockerson" => 7, "Dockie Dockerson" => 7, "Rockie Rockerson" => 7 }
      end
      
      it "gives the number of action points for one character" do
        @roster.action_points("Mockie Mockerson").should == 7
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
  
  describe "adjusting character stats" do

    it "increases the action points of each character at the beginning of a move" do
      @roster.next_move
      @roster.action_points.should == { "Mockie Mockerson" => 8, "Dockie Dockerson" => 8, "Rockie Rockerson" => 8 }
    end
    
    it "spends the action points of a single character" do
      @roster.take_action("Mockie Mockerson", 2)
      @roster.action_points.should == { "Mockie Mockerson" => 5, "Dockie Dockerson" => 7, "Rockie Rockerson" => 7 }
    end
  
  end
  
end