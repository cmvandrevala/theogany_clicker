class BattleRoster

  def initialize
    @character_list = []
    @total_moves = 0
  end

  def add(new_character)
    update_total_moves(new_character) if not_in_list?(new_character)
    store_character(new_character) if not_in_list?(new_character)
  end

  def table(subject, character_name = nil)
    return list_of_names if subject == :names
    return full_table(subject) if character_name.nil?
    return character_table(subject, character_name)
  end

  private

  def full_table(subject)
    movements = Hash.new
    @character_list.each do |character|
      movements[character.name] = character.send(subject)
    end
    movements
  end

  def character_table(subject, character_name)
    @character_list.each do |character|
      return character.send(subject) if character.name == character_name
    end
  end

  def list_of_names
    character_names = []
    @character_list.each { |character| character_names << character.name }
    character_names
  end

  def not_in_list?(new_character)
    @character_list.each do |character|
      return false if new_character.name == character.name
    end
    return true
  end

  def update_total_moves(new_character)
    @total_moves += new_character.moves
  end

  def store_character(new_character)
    @character_list << new_character
  end

end