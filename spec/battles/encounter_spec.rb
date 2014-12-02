require 'characters/character'
require 'battles/encounter'

class MockRoster

  def initialize
    @names = ["Bob", "Sam", "Chris"]
    @moves = {"Bob" => 1, "Sam" => 2, "Chris" => 3}
    @aps = {"Bob" => 2, "Sam" => 4, "Chris" => 6}
  end

  def table(subject, character_name = nil)
    if character_name.nil?
      return @names if subject == :names
      return @moves if subject == :moves
      return @aps if subject == :action_points
    end
    return @moves[character_name] if subject == :moves
    return @aps[character_name] if subject == :action_points
  end

end

describe Encounter do

  before(:each) do
    @encounter = Encounter.new(MockRoster.new)
  end

  describe "setting up the battle order" do

    it "includes only the roster characters" do
      @encounter.order.each do |character|
        flag = false
        flag = true if character == "Bob"
        flag = true if character == "Sam"
        flag = true if character == "Chris"
        expect(flag).to eq(true)
      end
    end

    it "has a total length equal to the total number of moves times 100 rounds" do
      expect(@encounter.order.length).to eq(600)
    end

    it "uses up all character moves before going to the next round" do
      expect(@encounter.order[0,6].count("Bob")).to eq(1)
      expect(@encounter.order[0,6].count("Sam")).to eq(2)
      expect(@encounter.order[0,6].count("Chris")).to eq(3)
    end

  end

  describe "table of all current APs" do

    it "starts each character off with a half of their maximum action points" do
      expect(@encounter.current_action_points).to eq({"Bob" => 1, "Sam" => 2, "Chris" => 3})
    end

    it "increments character's ap each turn" do
      @encounter.next_turn
      expect(@encounter.current_action_points).to eq({"Bob" => 2, "Sam" => 3, "Chris" => 4})
    end

  end

  describe "the current character up to move" do

    it "keeps track of who's turn it is" do
      @encounter.order.each do |character|
        expect(@encounter.current_player).to eq(character)
        @encounter.next_turn
      end
    end

  end

  describe "the current action points of the character up to move" do

    it "keeps track of the initial action points of the first character" do
      expect(@encounter.current_ap).to eq 1 if @encounter.current_player == "Bob"
      expect(@encounter.current_ap).to eq 2 if @encounter.current_player == "Sam"
      expect(@encounter.current_ap).to eq 3 if @encounter.current_player == "Chris"
    end

    it "returns the action points of a character after one turn" do
      @encounter.next_turn
      expect(@encounter.current_ap).to eq 2 if @encounter.current_player == "Bob"
      expect(@encounter.current_ap).to eq 3 if @encounter.current_player == "Sam"
      expect(@encounter.current_ap).to eq 4 if @encounter.current_player == "Chris"
    end

    it "returns the action points of a character after two turns" do
      2.times { @encounter.next_turn }
      expect(@encounter.current_ap).to eq 3 if @encounter.current_player == "Bob"
      expect(@encounter.current_ap).to eq 4 if @encounter.current_player == "Sam"
      expect(@encounter.current_ap).to eq 5 if @encounter.current_player == "Chris"
    end

    it "returns the action points of a character after many turns" do
      5.times { @encounter.next_turn }
      expect(@encounter.current_ap).to eq 6 if @encounter.current_player == "Bob"
      expect(@encounter.current_ap).to eq 7 if @encounter.current_player == "Sam"
      expect(@encounter.current_ap).to eq 8 if @encounter.current_player == "Chris"
    end

    it "returns ten action points after many rounds with no actions taken" do
      50.times { @encounter.next_turn }
      expect(@encounter.current_ap).to eq 10
    end

    it "allows you to spend ap" do
      @encounter.spend_ap(5)
      expect(@encounter.current_ap).to eq -4 if @encounter.current_player == "Bob"
      expect(@encounter.current_ap).to eq -3 if @encounter.current_player == "Sam"
      expect(@encounter.current_ap).to eq -2 if @encounter.current_player == "Chris"
    end

  end

end