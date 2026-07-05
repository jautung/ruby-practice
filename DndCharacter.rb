class DndCharacter
  attr_reader :strength
  attr_reader :dexterity
  attr_reader :constitution
  attr_reader :intelligence
  attr_reader :wisdom
  attr_reader :charisma

  attr_reader :constitution_modifier
  attr_reader :hitpoints

  def initialize
    @strength = DndCharacter.generate_score
    @dexterity = DndCharacter.generate_score
    @constitution = DndCharacter.generate_score
    @intelligence = DndCharacter.generate_score
    @wisdom = DndCharacter.generate_score
    @charisma = DndCharacter.generate_score

    @constitution_modifier = DndCharacter.modifier(constitution)
    @hitpoints = 10 + constitution_modifier
  end

  def self.modifier(constitution)
    ((constitution - 10) / 2).floor
  end

  def self.generate_score
    rolls = 4.times.map { rand(6) + 1 }
    rolls.sort.reverse.slice(...3).sum
  end
end

p DndCharacter.modifier(3)
p DndCharacter.modifier(14)

DndCharacter.new