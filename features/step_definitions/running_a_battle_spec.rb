require 'characters/character'
require 'battles/battle_roster'
require 'battles/encounter'

Given(/^I have created four characters$/) do
  @char_one = Character.new( {name: "Bob"} )
  @char_two = Character.new( {name: "Cindy"} )
  @char_three = Character.new( {name: "Samantha"} )
  @char_four = Character.new( {name: "Tobias"} )
end

Given(/^I have added them all to a battle roster$/) do
  @roster = BattleRoster.new
  @roster.add(@char_one)
  @roster.add(@char_two)
  @roster.add(@char_three)
  @roster.add(@char_four)
end

Given(/^I have initiated a new encounter using the roster$/) do
  @encounter = Encounter.new(@roster)
end

Then(/^each person should take the correct number of moves each round$/) do
  @encounter.order[0, 8].count("Bob").should == 2
  @encounter.order[0, 8].count("Cindy").should == 2
  @encounter.order[0, 8].count("Samantha").should == 2
  @encounter.order[0, 8].count("Tobias").should == 2
end