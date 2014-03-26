Feature: Running a battle
  In order to run a battle scenario smoothly
  As the dungeon master
  I want to keep track of battle statistics

Background:
  Given I have created four characters
  And I have added them all to a battle roster
  And I have initiated a new encounter using the roster
  
Scenario: Everybody takes the correct number of moves per round
  Then each person should take the correct number of moves each round