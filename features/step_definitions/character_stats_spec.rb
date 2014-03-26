require 'characters/character'

Given(/^I have created a new character$/) do
  @character = Character.new( {name: "Bob"} )
end