# Theogany Clicker

## Background

Theogany is a tabletop role-playing game invented by Tyler Browning. As of now it is still in the development stage. This program will keep track of a player's moves during combat according to the rules of his game. It is not meant to keep track of any player stats - simply the turn order and the action points available to a player that can be spent that turn.

## Instructions

### Characters

In order to create a new character use the command:

        sam = Character.new({name: "Sam"})

Upon initialization, you can also specify a custom number of moves and action points:

        john = Character.new({name: "John", moves: 5, action_points: 20})

If no moves or action points are specified, the program assumes a default of two moves and ten action points.

### Battle Roster

After the party and enemy characters have been created, you can create a new battle roster using:

        roster = BattleRoster.new

You can then add each character to the roster by using:

        roster.add(character_to_add)

You can view character stats using the table method. The method accepts a subject area (i.e. :names, :moves, :action_points) and an optional character name:

        roster.add(sam)
        roster.add(john)

        roster.table(:names)
        >> ["Sam", "John"]

        roster.table(:moves, "John")
        >> 5

### Encounters

The encounter is a single battle in the world of Theogany. In order to initialize a new encounter, pass a roster into the Encounter class:

        encounter = Encounter.new(roster)

From there, you can control the flow of the encounter and get current information about the characters involved. The encounter class takes care of all of the fine details in the background. Some useful methods are:

* current_player - Return the current player up to move.
* current_ap - Return the current number of action points that a player has.
* spend_ap(amount) - Spend action points to take a turn.
* next_turn - Move to the next player in the turn order and increment every player's action point count by one


