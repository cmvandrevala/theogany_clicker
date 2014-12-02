require 'surrogate/rspec'
require 'characters/mock_character'
require 'battles/battle_roster'

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
      new_roster.add(MockCharacter.new)
      expect(new_roster.table(:names)).to eq(["Bob"])
    end

    it "does not add a duplicate character" do
      @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 1}))
      expect(@roster.table(:names)).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"])
    end

    it "does not add a character with a duplicate name" do
      @roster.add(MockCharacter.new({name: "Mockie Mockerson", moves: 5}))
      expect(@roster.table(:names)).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"])
    end

    it "adds a character with a duplicate number of moves" do
      @roster.add(MockCharacter.new({name: "Sockie Sockerson", moves: 1}))
      expect(@roster.table(:names)).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson", "Sockie Sockerson"])
    end

  end

  describe "viewing tables of character stats" do

    context "names" do

      it "gives a table of the character names" do
        expect(@roster.table(:names)).to eq(["Mockie Mockerson", "Dockie Dockerson", "Rockie Rockerson"])
      end

    end

    context "number of moves" do

      it "gives a table of the number of moves for each character" do
        expect(@roster.table(:moves)).to eq({ "Mockie Mockerson" => 1, "Dockie Dockerson" => 2, "Rockie Rockerson" => 3 })
      end

      it "gives the number of moves for one character" do
        expect(@roster.table(:moves, "Mockie Mockerson")).to eq(1)
      end

    end

    context "maximum number of action points" do

      it "gives a table of the maximum number of action points of each character" do
        expect(@roster.table(:action_points)).to eq({ "Mockie Mockerson" => 10, "Dockie Dockerson" => 10, "Rockie Rockerson" => 10 })
      end

      it "gives the number of action points for one character" do
        expect(@roster.table(:action_points, "Mockie Mockerson")).to eq(10)
      end

    end

  end

end