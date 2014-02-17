class BattleRoster
  
  def initialize
    @character_list = []
    @character_names = []
    @total_action_points = 0
  end

  def add(new_character)
    store_character_name(new_character) if not_in_list?(new_character)
    increment_action_points(new_character) if not_in_list?(new_character)
    store_character(new_character) if not_in_list?(new_character)
  end
  # 
  def list_characters
    @character_names
  end
  
  def probability(character)
    character.action_points.to_f/@total_action_points.to_f
  end
  
  private

  def not_in_list?(new_character)
    @character_list.each do |character|
      return false if new_character.name == character.name
    end
    return true
  end
  
  def increment_action_points(new_character)
    @total_action_points += new_character.action_points
  end
  
  def store_character_name(new_character)
    @character_names << new_character.name
  end
  
  def store_character(new_character)
    @character_list << new_character
  end
  
end