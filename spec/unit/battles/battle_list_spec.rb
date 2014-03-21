require 'surrogate/rspec'
require 'characters/mock_character'
require 'battles/mock_battle_roster'
require 'battles/battle_list'

describe BattleList do
  
  before(:each) do
    @roster = MockBattleRoster.new
    @battle_list = BattleList.new(@roster)
  end
  
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
  
  it "starts each character off with a half of their maximum action points" do
    @battle_list.current_ap.should == {"Bob" => 5, "Sam" => 5, "Chris" => 6}
  end
  
  it "increments character's ap each turn" do
    @battle_list.next_turn
    @battle_list.current_ap.should == {"Bob" => 6, "Sam" => 6, "Chris" => 7}
  end
  
  it "keeps track of who's turn it is" do
    @battle_list.order.each do |character|
      @battle_list.current_player.should == character
      @battle_list.next_turn
    end
  end
  
end