require 'characters/character'
require 'battles/battle_roster'
require 'battles/battle_list'

describe "A Battle" do

  before(:each) do
    @roster = BattleRoster.new
    @roster.add(Character.new({name: "Mockie Mockerson", moves: 1}))
    @roster.add(Character.new({name: "Dockie Dockerson", moves: 2}))
    @roster.add(Character.new({name: "Rockie Rockerson", moves: 3}))
    @battle_list = BattleList.new(@roster)
  end

end