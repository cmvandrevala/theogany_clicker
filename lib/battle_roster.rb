class BattleRoster
  
  def initialize
    @character_list = []
    @total_moves = 0
  end

  def add(new_character)
    increment_action_points(new_character) if not_in_list?(new_character)
    store_character(new_character) if not_in_list?(new_character)
  end

  def character_names
    character_names = []
    @character_list.each { |character| character_names << character.name }
    character_names
  end
  
  def movements(character_name = nil)
    if character_name != nil
      @character_list.each do |character|
        return character.moves if character.name == character_name
      end
    elsif character_name == nil
      movements = Hash.new
      @character_list.each do |character|
        movements[character.name] = character.moves
      end
      movements
    end
  end
  
  def statuses(character_name = nil)
    if character_name != nil
      @character_list.each do |character|
        return character.status if character.name == character_name
      end
    elsif character_name == nil
      statuses = Hash.new
      @character_list.each do |character|
        statuses[character.name] = character.status
      end
      statuses
    end
  end
    
  def action_points(character_name = nil)
    if character_name != nil
      @character_list.each do |character|
        return character.action_points if character.name == character_name
      end
    elsif character_name == nil
      points = Hash.new
      @character_list.each do |character|
        points[character.name] = character.action_points
      end
      points
    end
  end
  
  def probability(character_name = nil)
    if character_name != nil
      @character_list.each do |character|
        return character.moves.to_f/@total_moves.to_f if character.name == character_name
      end
    elsif character_name == nil
      probabilities = Hash.new
      @character_list.each do |character|
        probabilities[character.name] = character.moves.to_f/@total_moves.to_f
      end
      probabilities
    end
  end
  
  def next_move
    @character_list.each do |character|
      character.increase_ap
    end
  end
  
  def take_action(character_name, points)
    @character_list.each do |character|
      return character.spend_ap(points) if character.name == character_name
    end
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