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
      expect(MockBattleRoster).to be_substitutable_for(BattleRoster)
    end
  
  end
  
  describe "adding to the roster" do
    
    it "adds a single character" do
      new_roster = BattleRoster.new
      new_roster.add(MockCharacter.new)
      expect(new_roster.character_names).to eq(["Bob"])
    end
  
    it "does not add a duplicate character" do
      @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 1}))
      expect(@roster.character_names).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"])
    end
    
    it "does not add a character with a duplicate name" do
      @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 5}))
      expect(@roster.character_names).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"])
    end
    
    it "adds a character with a duplicate number of moves" do
      @roster.add(MockCharacter.new({name: "Sockie Sockerson", moves: 1}))
      expect(@roster.character_names).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson", "Sockie Sockerson"])
    end
  
  end
  
  describe "calculating battle statistics" do
    
    context "movement probability" do
      
      it "displays a table of movement probabilities" do
        expect(@roster.probability).to eq({ "Mockie Mockerson" => 1.0/6.0, "Dockie Dockerson" => 2.0/6.0, "Rockie Rockerson" => 3.0/6.0 })
      end
      
      it "displays the probability of a character moving" do
        expect(@roster.probability("Mockie Mockerson")).to eq(1.0/6.0)
      end
      
      it "displays the probability of a different character moving" do
        expect(@roster.probability("Dockie Dockerson")).to eq(2.0/6.0)
      end

      it "should not round to zero" do
        expect(@roster.probability("Dockie Dockerson")).not_to eq(0.0)  
      end
      
    end
  
  end
  
  describe "viewing tables of static character stats" do
    
    context "names" do
      
      it "gives a table of the character names" do
        expect(@roster.character_names).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"])
      end
      
    end
    
    context "number of moves" do
      
      it "gives a table of the number of moves for each character" do
        expect(@roster.movements).to eq({ "Mockie Mockerson" => 1, "Dockie Dockerson" => 2, "Rockie Rockerson" => 3 })
      end
      
      it "gives the number of moves for one character" do
        expect(@roster.movements("Mockie Mockerson")).to eq(1)
      end
      
    end
    
    context "maximum number of action points" do
      
      it "gives a table of the maximum number of action points of each character" do
        expect(@roster.maximum_action_points).to eq({ "Mockie Mockerson" => 10, "Dockie Dockerson" => 10, "Rockie Rockerson" => 10 })
      end
      
      it "gives the number of action points for one character" do
        expect(@roster.maximum_action_points("Mockie Mockerson")).to eq(10)
      end
      
    end
    
    context "statuses" do
      
      it "gives a table of the statuses of each character" do
        expect(@roster.statuses).to eq({ "Mockie Mockerson" => :active, "Dockie Dockerson" => :active, "Rockie Rockerson" => :active })
      end
      
      it "gives the status for one character" do
        expect(@roster.statuses("Mockie Mockerson")).to eq(:active)
      end
      
    end
  
  end
  
end