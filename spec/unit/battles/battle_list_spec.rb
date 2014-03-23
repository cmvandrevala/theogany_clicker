require 'surrogate/rspec'
require 'characters/mock_character'
require 'battles/mock_battle_roster'
require 'battles/battle_list'

describe BattleList do
  
  before(:each) do
    @roster = MockBattleRoster.new
    @battle_list = BattleList.new(@roster)
  end
  
  describe "setting up the battle order" do
  
    it "includes the roster characters in the order" do
      @battle_list.order.each do |character|
        flag = false
        flag = true if character == "Bob"
        flag = true if character == "Sam"
        flag = true if character == "Chris"
        flag.should == true
      end
    end
    
    it "has a total length equal to the total number of moves times 100 rounds" do
      @battle_list.order.length.should == 600
    end
  
  end
  
  describe "table of all current APs" do
    
    it "starts each character off with a half of their maximum action points" do
      @battle_list.current_aps.should == {"Bob" => 5, "Sam" => 5, "Chris" => 6}
    end
  
    it "increments character's ap each turn" do
      @battle_list.next_turn
      @battle_list.current_aps.should == {"Bob" => 6, "Sam" => 6, "Chris" => 7}
    end    
    
  end
  
  describe "the current character up to move" do
  
    it "keeps track of who's turn it is" do
      @battle_list.order.each do |character|
        @battle_list.current_player.should == character
        @battle_list.next_turn
      end
    end
  
  end
  
  describe "the current ap of the character up to move" do
  
    it "keeps track of the initial action points of the first character" do
      @battle_list.current_ap.should == @battle_list.current_aps[@battle_list.current_player]
    end
  
    it "returns the action points of a character after one turn" do
      @battle_list.next_turn
      @battle_list.current_ap.should == @battle_list.current_aps[@battle_list.current_player]
    end
  
    it "returns the action points of a character after two turns" do
      2.times { @battle_list.next_turn }
      @battle_list.current_ap.should == @battle_list.current_aps[@battle_list.current_player]
    end  
  
    it "returns the action points of a character after multiple turns" do
      3.times { @battle_list.next_turn }
      @battle_list.current_ap.should == @battle_list.current_aps[@battle_list.current_player]
    end
  
    it "returns ten action points after many rounds with no actions taken" do
      50.times { @battle_list.next_turn }
      @battle_list.current_ap.should == 10
    end
  
    it "allows you to spend ap" do
      initial_ap = @battle_list.current_aps[@battle_list.current_player]
      @battle_list.spend_ap(5)
      @battle_list.current_ap.should == initial_ap - 5
    end
  
  end
  
end