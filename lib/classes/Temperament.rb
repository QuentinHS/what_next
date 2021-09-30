class Temperament 
  # include temperament_info

  attr_accessor :temperament_type, :character_type
  def initialize(temperament_type, character_type)
    @temperament_type = temperament_type
    @character_type = character_type
  end

  def to_s
    puts "I am a #{self.temperament_type} and a #{self.character_type}"
  end

end