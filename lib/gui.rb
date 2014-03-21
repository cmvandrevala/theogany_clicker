require 'battles/battle_list'
require 'battles/battle_roster'
require 'characters/character'

Shoes.app width: 500, height: 500 do
  background "white"
  tagline strong("Fight!")
  
  $roster = BattleRoster.new
  
  stack {
    
    button "Add a Character" do
      window title: "Add a Character" do
        stack do
          para "Name"
          edit_line { |input| @name = input.text }
          para "Number of Moves"
          edit_line { |input| @moves = input.text }
          button "OK" do
            character = Character.new({name: @name, moves: @moves.to_f})
            $roster.add(character)
          end
        end
      end
    end
    
    button "Display Roster" do
      window title: "Roster" do
        para "Moves\n"
        $roster.movements.each do |name, moves|
          para "#{name}\t#{moves.to_i}\n"
        end
        para "\nMaximum Action Points\n"
        $roster.maximum_action_points.each do |name, ap|
          para "#{name}\t#{ap.to_i}\n"
        end
        para "\nStatuses\n"
        $roster.statuses.each do |name, status|
          para "#{name}\t#{status.to_s}\n"
        end
      end
    end
    
  }
  
end
