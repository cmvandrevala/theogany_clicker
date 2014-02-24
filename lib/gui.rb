require 'battle_list'
require 'battle_roster'
require 'character'

Shoes.app width: 300, height: 300 do
  background "white"
  title "Fight!"
  
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
        $roster.movements.each do |name, moves|
          para "#{name}\t#{moves.to_i}\n"
        end
      end
    end
    
    button "Display Battle Order" do
      window title: "Battle Order" do
        @order = []
        $roster.movements.each do |name, moves|
          moves.to_i.times { @order << name }
        end
        @order.shuffle!
        @order.each do |name|
          para "#{name}\n"
        end
      end
    end
    
  }
  
end
