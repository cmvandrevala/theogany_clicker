load 'battle_list.rb'
load 'battle_roster.rb'
load 'character.rb'

a = Character.new({name: "Robert Normango Rossmagango", moves: 2})
b = Character.new({name: "Laz", moves: 2})
c = Character.new({name: "Lord Kelvin", moves: 3})
d = Character.new({name: "Mallow Gaiman", moves: 2})
e = Character.new({name: "Emily Lee", moves: 2})
f = Character.new({name: "Tatiana Marcus", moves: 2})

g = Character.new({name: "Alice the Asian Woman", moves: 2})
h = Character.new({name: "Event Hulk Rising", moves: 2})
i = Character.new({name: "Sgt. Clark", moves: 3})

roster = BattleRoster.new
roster.add(a)
roster.add(b)
roster.add(c)
roster.add(d)
roster.add(e)
roster.add(f)
#roster.add(g)
#roster.add(h)
#roster.add(i)

list = BattleList.new(roster)
round = 1

100.times do

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