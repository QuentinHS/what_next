require_relative '../modules/temperament_info'
require 'colorize'

class Temperament 
  include TemperamentInfo
  attr_accessor :temperament_type, :character_type

  # initialise temperament type and character type from personality quiz
  def initialize(temperament_type, character_type)
    @temperament_type = temperament_type
    @character_type = character_type
  end

  # display personality information function based on assigned temperament
  def give_personality_info
    case self.character_type
    when 'estp'
      TemperamentInfo.artisan_info
      TemperamentInfo.estp_info
    when 'istp'
      TemperamentInfo.artisan_info
      TemperamentInfo.istp_info
    when 'esfp'
      TemperamentInfo.artisan_info
      TemperamentInfo.esfp_info
    when 'isfp'
      TemperamentInfo.artisan_info
      TemperamentInfo.isfp_info
    when 'estj'
      TemperamentInfo.guardian_info
      TemperamentInfo.estj_info
    when 'istj'
      TemperamentInfo.guardian_info
      TemperamentInfo.istj_info
    when 'esfp'
      TemperamentInfo.guardian_info
      TemperamentInfo.esfp_info
    when 'isfj'
      TemperamentInfo.guardian_info
      TemperamentInfo.isfj_info
    when 'enfj'
      TemperamentInfo.idealist_info
      TemperamentInfo.enfj_info
    when 'infj'
      TemperamentInfo.idealist_info
      TemperamentInfo.infj_info
    when 'enfp'
      TemperamentInfo.idealist_info
      TemperamentInfo.enfp_info
    when 'infp'
      TemperamentInfo.idealist_info
      TemperamentInfo.infp_info
    when 'entj'
      TemperamentInfo.rational_info
      TemperamentInfo.entj_info
    when 'intj'
      TemperamentInfo.rational_info
      TemperamentInfo.intj_info
    when 'entp'
      TemperamentInfo.rational_info
      TemperamentInfo.entp_info
    when 'intp'
      TemperamentInfo.rational_info
      TemperamentInfo.intp_info
    end
  end

end

