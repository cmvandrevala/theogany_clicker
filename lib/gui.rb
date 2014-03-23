require 'characters/character'
require 'battles/battle_list'
require 'battles/battle_roster'

roster = BattleRoster.new

Shoes.app :width => 500, :height => 500 do
    
  background "#dde"
  
  stack {
    
    button "Add a New Character" do
      window title: "Add a Character" do
        para "Add a New Character"
        stack do
          para "Name"
          edit_line { |input| @name = input.text }
          para "Number of Moves"
          edit_line { |input| @moves = input.text }
          button "OK" do
            character = Character.new({name: @name, moves: @moves.to_i})
            roster.add(character)
          end
        end
      end
    end
    
    button "Display Roster" do
      window title: "Roster" do
        para "Battle Roster"
        para "Moves\n"
        roster.movements.each do |name, moves|
          para "#{name}\t#{moves.to_i}\n"
        end
        para "\nMaximum Action Points\n"
        roster.maximum_action_points.each do |name, ap|
          para "#{name}\t#{ap.to_i}\n"
        end
        para "\nStatuses\n"
        roster.statuses.each do |name, status|
          para "#{name}\t#{status.to_s}\n"
        end
      end
    end
    
    button "Start Battle" do
      window title: "Start Battle" do
        battle_list = BattleList.new(roster)
        para "Start Battle\n\n"
        @current_player = para "#{battle_list.current_player} #{battle_list.current_ap}\n"
        edit_line { |input| @ap = input.text }
        button "Spend AP" do
          battle_list.spend_ap(@ap.to_i)
          battle_list.next_turn
          @current_player.replace "#{battle_list.current_player} #{battle_list.current_ap}\n"          
        end
        para "\n"
        button "Next Turn!" do
          battle_list.next_turn
          @current_player.replace "#{battle_list.current_player} #{battle_list.current_ap}\n"
        end
      end
    end
    
  }

end
