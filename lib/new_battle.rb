load 'battle_list.rb'
load 'battle_roster.rb'
load 'character.rb'

a = Character.new({name: "Robert Normango Rossmagango", moves: 2})
b = Character.new({name: "b", moves: 2})
c = Character.new({name: "c", moves: 2})
d = Character.new({name: "d", moves: 2})
e = Character.new({name: "e", moves: 2})
f = Character.new({name: "f", moves: 2})
g = Character.new({name: "g", moves: 2})
h = Character.new({name: "h", moves: 2})

roster = BattleRoster.new
roster.add(a)
roster.add(b)
roster.add(c)
roster.add(d)
roster.add(e)
roster.add(f)
roster.add(g)
roster.add(h)

list = BattleList.new(roster)
round = 1

20.times do

  puts
  puts
  puts "Round #{round}! Fight!"
  puts "==============="
  
  list.order.each do |name|
    puts
    puts
    puts "Up next is #{name}!"
    puts "You have #{roster.action_points(name)} action points left."
    puts "Do you want to spend AP (1) or skip your turn (2)?"
    print "> "
    input = gets.chomp.to_i
    if input == 1
      puts "How much?"
      amount = gets.chomp.to_i
      if amount > roster.action_points(name)
        puts "That's too expensive, loser..."
        roster.next_move
        next
      else
        roster.take_action(name, amount)
      end
    elsif input == 2
      puts "Ok, moving on."
    else
      puts "Yeah... not an option, we'll just skip your turn dumbass..."
    end
    roster.next_move
  end
  
  round += 1

end