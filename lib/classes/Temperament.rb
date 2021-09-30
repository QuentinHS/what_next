require_relative '../modules/temperament_info'
require 'colorize'

class Temperament 
  include TemperamentInfo

  attr_accessor :temperament_type, :character_type
  def initialize(temperament_type, character_type)
    @temperament_type = temperament_type
    @character_type = character_type
  end

  def give_personality_info
    case @character_type
    when 'estp'
      TemperamentInfo.artisan_info
      TemperamentInfo.estp_info
    end
  end


  def to_s
    puts "I am a #{self.temperament_type} and a #{self.character_type}"
  end

end

temp = Temperament.new('Artisan', 'estp')
temp.give_personality_info