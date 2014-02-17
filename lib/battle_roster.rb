class BattleRoster
  
  def initialize
    @character_list = []
    @total_moves = 0
  end

  def add(new_character)
    increment_action_points(new_character) if not_in_list?(new_character)
    store_character(new_character) if not_in_list?(new_character)
  end

  def list_characters
    character_names = []
    @character_list.each { |character| character_names << character.name }
    character_names
  end
  
  def probability(character)
    character.moves.to_f/@total_moves.to_f
  end
  
  def movements
    movements = Hash.new
    @character_list.each do |character|
      movements[character.name] = character.moves
    end
    movements
  end
  
  private

  def not_in_list?(new_character)
    @character_list.each do |character|
      return false if new_character.name == character.name
    end
    return true
  end
  
  def increment_action_points(new_character)
    @total_moves += new_character.moves
  end
  
  def store_character(new_character)
    @character_list << new_character
  end
  
end